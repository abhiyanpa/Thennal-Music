/*
 *     Copyright (C) 2026 Abhiyan P A
 *
 *     Thennal Music is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     Thennal Music is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *
 *     For more information about Thennal Music, including how to contribute,
 *     please visit: https://github.com/abhiyanpa/Thennal-Music
 */

import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:audio_service/audio_service.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thennal_music/API/thennal_api.dart';
import 'package:thennal_music/extensions/l10n.dart';
import 'package:thennal_music/localization/app_localizations.dart';
import 'package:thennal_music/services/audio_service.dart';
import 'package:thennal_music/services/data_manager.dart';
import 'package:thennal_music/services/io_service.dart';
import 'package:thennal_music/services/logger_service.dart';
import 'package:thennal_music/services/playlist_sharing.dart';
import 'package:thennal_music/services/router_service.dart';
import 'package:thennal_music/services/settings_manager.dart';
import 'package:thennal_music/services/update_manager.dart';
import 'package:thennal_music/style/app_themes.dart';
import 'package:thennal_music/utilities/flutter_toast.dart';
import 'package:path_provider/path_provider.dart';

late ThennalAudioHandler audioHandler;

final logger = Logger();
final appLinks = AppLinks();

bool isFdroidBuild = false;
bool isUpdateChecked = false;

const appLanguages = <String, String>{
  'English': 'en',
  'Arabic': 'ar',
  'Chinese (Simplified)': 'zh',
  'Chinese (Traditional)': 'zh-Hant',
  'Estonian': 'et',
  'French': 'fr',
  'German': 'de',
  'Greek': 'el',
  'Hindi': 'hi',
  'Hebrew': 'he',
  'Hungarian': 'hu',
  'Indonesian': 'id',
  'Italian': 'it',
  'Japanese': 'ja',
  'Korean': 'ko',
  'Russian': 'ru',
  'Polish': 'pl',
  'Portuguese': 'pt',
  'Spanish': 'es',
  'Swedish': 'sv',
  'Turkish': 'tr',
  'Ukrainian': 'uk',
};

final List<Locale> appSupportedLocales = appLanguages.values.map((
  languageCode,
) {
  final parts = languageCode.split('-');
  if (parts.length > 1) {
    return Locale.fromSubtags(languageCode: parts[0], scriptCode: parts[1]);
  }
  return Locale(languageCode);
}).toList();

class ThennalMusic extends StatefulWidget {
  const ThennalMusic({super.key});

  static Future<void> updateAppState(
    BuildContext context, {
    ThemeMode? newThemeMode,
    Locale? newLocale,
    Color? newAccentColor,
    bool? useSystemColor,
  }) async {
    context.findAncestorStateOfType<_ThennalMusicState>()!.changeSettings(
      newThemeMode: newThemeMode,
      newLocale: newLocale,
      newAccentColor: newAccentColor,
      systemColorStatus: useSystemColor,
    );
  }

  @override
  _ThennalMusicState createState() => _ThennalMusicState();
}

class _ThennalMusicState extends State<ThennalMusic> {
  void changeSettings({
    ThemeMode? newThemeMode,
    Locale? newLocale,
    Color? newAccentColor,
    bool? systemColorStatus,
  }) {
    setState(() {
      if (newThemeMode != null) {
        themeMode = newThemeMode;
        brightness = getBrightnessFromThemeMode(newThemeMode);
      }
      if (newLocale != null) {
        languageSetting = newLocale;
      }
      if (newAccentColor != null) {
        if (systemColorStatus != null &&
            useSystemColor.value != systemColorStatus) {
          useSystemColor.value = systemColorStatus;
          addOrUpdateData('settings', 'useSystemColor', systemColorStatus);
        }
        primaryColorSetting = newAccentColor;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    final platformDispatcher = PlatformDispatcher.instance;

    // This callback is called every time the brightness changes.
    platformDispatcher.onPlatformBrightnessChanged = () {
      if (themeMode == ThemeMode.system) {
        setState(() {
          brightness = platformDispatcher.platformBrightness;
        });
      }
    };

    offlineMode.addListener(_onOfflineModeChanged);

    try {
      LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString(
          'assets/licenses/paytone.txt',
        );
        yield LicenseEntryWithLineBreaks(['paytoneOne'], license);
      });
    } catch (e, stackTrace) {
      logger.log('License Registration Error', e, stackTrace);
    }

    if (!isFdroidBuild) {
      if (shouldWeCheckUpdates.value == true) {
        if (!isUpdateChecked && kReleaseMode) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (!offlineMode.value) {
              checkAppUpdates();
            }
            isUpdateChecked = true;
          });
        }
      } else {
        if (shouldWeCheckUpdates.value == null) {
          // show dialog that asks user if they want to enable update checks
          SchedulerBinding.instance.addPostFrameCallback((_) {
            showUpdateCheckDialog(NavigationManager().context);
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            if (!offlineMode.value) {
              await fetchAnnouncementOnly();
            }
          });
        }
      }
    }
  }

  @override
  void dispose() {
    offlineMode.removeListener(_onOfflineModeChanged);

    Hive.close();
    super.dispose();
  }

  void _onOfflineModeChanged() {
    // Force rebuild when offline mode changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        final colorScheme = getAppColorScheme(
          lightColorScheme,
          darkColorScheme,
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarContrastEnforced: true,
            statusBarBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            systemNavigationBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
          ),
          child: MaterialApp.router(
            themeMode: themeMode,
            darkTheme: getAppTheme(colorScheme),
            theme: getAppTheme(colorScheme),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: appSupportedLocales,
            locale: languageSetting,
            routerConfig: NavigationManager.router,
          ),
        );
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialisation();

  runApp(const ThennalMusic());
}

Future<void> initialisation() async {
  try {
    await Hive.initFlutter();

    await Future.wait([
      Hive.openBox('settings'),
      Hive.openBox('user'),
      Hive.openBox('userNoBackup'),
      Hive.openBox('cache'),
    ]);

    audioHandler = await AudioService.init(
      builder: ThennalAudioHandler.new,
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.abhiyanpa.thennalmusic',
        androidNotificationChannelName: 'Thennal Music',
        androidNotificationIcon: 'drawable/ic_launcher_foreground',
        androidShowNotificationBadge: true,
        androidStopForegroundOnPause: false,
      ),
    );

    // Init router
    NavigationManager.instance;

    try {
      // Listen to incoming links while app is running
      appLinks.uriLinkStream.listen(
        handleIncomingLink,
        onError: (err) {
          logger.log('URI link error:', err, null);
        },
      );
    } on PlatformException {
      logger.log('Failed to get initial uri', null, null);
    }

    if (isFdroidBuild && !offlineMode.value) {
      await fetchAnnouncementOnly();
    }
  } catch (e, stackTrace) {
    logger.log('Initialization Error', e, stackTrace);
  }

  applicationDirPath = (await getApplicationDocumentsDirectory()).path;
  await FilePaths.ensureDirectoriesExist();
}

void handleIncomingLink(Uri? uri) async {
  if (uri != null && uri.scheme == 'thennalmusic' && uri.host == 'playlist') {
    try {
      if (uri.pathSegments[0] == 'custom') {
        final encodedPlaylist = uri.pathSegments[1];

        final playlist = await PlaylistSharingService.decodeAndExpandPlaylist(
          encodedPlaylist,
        );

        if (playlist != null) {
          userCustomPlaylists.value = [...userCustomPlaylists.value, playlist];
          await addOrUpdateData(
            'user',
            'customPlaylists',
            userCustomPlaylists.value,
          );
          showToast(
            NavigationManager().context,
            '${NavigationManager().context.l10n!.addedSuccess}!',
          );
        } else {
          showToast(NavigationManager().context, 'Invalid playlist data');
        }
      }
    } catch (e) {
      showToast(NavigationManager().context, 'Failed to load playlist');
    }
  }
}
