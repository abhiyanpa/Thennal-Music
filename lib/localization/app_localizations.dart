import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('tr'),
    Locale('uk'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    Locale('zh'),
  ];

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @accentChangeMsg.
  ///
  /// In en, this message translates to:
  /// **'Accent color updated successfully'**
  String get accentChangeMsg;

  /// No description provided for @accentColor.
  ///
  /// In en, this message translates to:
  /// **'Accent color'**
  String get accentColor;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add playlist'**
  String get addPlaylist;

  /// No description provided for @addToLikedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Add to liked playlists'**
  String get addToLikedPlaylists;

  /// No description provided for @addToLikedSongs.
  ///
  /// In en, this message translates to:
  /// **'Add to liked songs'**
  String get addToLikedSongs;

  /// No description provided for @addToPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add to playlist'**
  String get addToPlaylist;

  /// No description provided for @addToQueue.
  ///
  /// In en, this message translates to:
  /// **'Add to queue'**
  String get addToQueue;

  /// No description provided for @addedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Added playlists'**
  String get addedPlaylists;

  /// No description provided for @addedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Added successfully'**
  String get addedSuccess;

  /// No description provided for @addedToLikedSongs.
  ///
  /// In en, this message translates to:
  /// **'Added to liked songs'**
  String get addedToLikedSongs;

  /// No description provided for @album.
  ///
  /// In en, this message translates to:
  /// **'Album'**
  String get album;

  /// No description provided for @albums.
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get albums;

  /// No description provided for @alreadyDownloading.
  ///
  /// In en, this message translates to:
  /// **'Already downloading'**
  String get alreadyDownloading;

  /// No description provided for @appUpdateIsAvailable.
  ///
  /// In en, this message translates to:
  /// **'An update is available'**
  String get appUpdateIsAvailable;

  /// No description provided for @artist.
  ///
  /// In en, this message translates to:
  /// **'Artist'**
  String get artist;

  /// No description provided for @audioQuality.
  ///
  /// In en, this message translates to:
  /// **'Audio quality'**
  String get audioQuality;

  /// No description provided for @audioQualityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get audioQualityHigh;

  /// No description provided for @audioQualityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get audioQualityLow;

  /// No description provided for @audioQualityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get audioQualityMedium;

  /// No description provided for @audioQualityMsg.
  ///
  /// In en, this message translates to:
  /// **'Audio quality updated'**
  String get audioQualityMsg;

  /// No description provided for @audioQualityUltra.
  ///
  /// In en, this message translates to:
  /// **'Ultra'**
  String get audioQualityUltra;

  /// No description provided for @audioQualityVeryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get audioQualityVeryHigh;

  /// No description provided for @automaticSongPicker.
  ///
  /// In en, this message translates to:
  /// **'Automatic song picker'**
  String get automaticSongPicker;

  /// No description provided for @automaticSongPickerDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically play a random song after the current track ends.'**
  String get automaticSongPickerDescription;

  /// No description provided for @automaticUpdateChecks.
  ///
  /// In en, this message translates to:
  /// **'Automatic update checks'**
  String get automaticUpdateChecks;

  /// No description provided for @automaticUpdateChecksDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically check for app updates on startup.'**
  String get automaticUpdateChecksDescription;

  /// No description provided for @backToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Back to favorites'**
  String get backToFavorites;

  /// No description provided for @backedupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data successfully backed up'**
  String get backedupSuccess;

  /// No description provided for @backupError.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while backing up data'**
  String get backupError;

  /// No description provided for @backupUserData.
  ///
  /// In en, this message translates to:
  /// **'Backup user data'**
  String get backupUserData;

  /// No description provided for @becomeSponsor.
  ///
  /// In en, this message translates to:
  /// **'Become a sponsor'**
  String get becomeSponsor;

  /// No description provided for @cacheMsg.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheMsg;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @checkForUpdates.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates?'**
  String get checkForUpdates;

  /// No description provided for @chooseBackupDir.
  ///
  /// In en, this message translates to:
  /// **'Choose backup folder'**
  String get chooseBackupDir;

  /// No description provided for @chooseBackupFiles.
  ///
  /// In en, this message translates to:
  /// **'Select files for backup'**
  String get chooseBackupFiles;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get clearCache;

  /// No description provided for @clearQueue.
  ///
  /// In en, this message translates to:
  /// **'Clear queue'**
  String get clearQueue;

  /// No description provided for @clearRecentlyPlayed.
  ///
  /// In en, this message translates to:
  /// **'Clear recently played'**
  String get clearRecentlyPlayed;

  /// No description provided for @clearRecentlyPlayedQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear recently played history?'**
  String get clearRecentlyPlayedQuestion;

  /// No description provided for @clearSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear search history'**
  String get clearSearchHistory;

  /// No description provided for @clearSearchHistoryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear search history?'**
  String get clearSearchHistoryQuestion;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @copyLogs.
  ///
  /// In en, this message translates to:
  /// **'Copy logs'**
  String get copyLogs;

  /// No description provided for @copyLogsNoLogs.
  ///
  /// In en, this message translates to:
  /// **'No logs to copy'**
  String get copyLogsNoLogs;

  /// No description provided for @copyLogsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logs copied successfully'**
  String get copyLogsSuccess;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @createFolder.
  ///
  /// In en, this message translates to:
  /// **'Create folder'**
  String get createFolder;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @customPlaylistImgUrl.
  ///
  /// In en, this message translates to:
  /// **'Custom playlist image URL'**
  String get customPlaylistImgUrl;

  /// No description provided for @customPlaylistName.
  ///
  /// In en, this message translates to:
  /// **'Custom playlist name'**
  String get customPlaylistName;

  /// No description provided for @customPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Custom playlists'**
  String get customPlaylists;

  /// No description provided for @dateAdded.
  ///
  /// In en, this message translates to:
  /// **'Date Added'**
  String get dateAdded;

  /// No description provided for @default_.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get default_;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteFolder.
  ///
  /// In en, this message translates to:
  /// **'Delete folder'**
  String get deleteFolder;

  /// No description provided for @deleteFolderQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this folder? Playlists inside will be moved to the main library.'**
  String get deleteFolderQuestion;

  /// No description provided for @deletePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Delete playlist'**
  String get deletePlaylist;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadAppUpdate.
  ///
  /// In en, this message translates to:
  /// **'Download app update'**
  String get downloadAppUpdate;

  /// No description provided for @downloadCancelled.
  ///
  /// In en, this message translates to:
  /// **'Download cancelled'**
  String get downloadCancelled;

  /// No description provided for @downloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed'**
  String get downloadFailed;

  /// No description provided for @downloadPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Download playlist'**
  String get downloadPlaylist;

  /// No description provided for @dynamicColor.
  ///
  /// In en, this message translates to:
  /// **'Dynamic accent color (Android 12+)'**
  String get dynamicColor;

  /// No description provided for @editPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Edit playlist'**
  String get editPlaylist;

  /// No description provided for @emptyFolderMsg.
  ///
  /// In en, this message translates to:
  /// **'This folder is empty. Add playlists to organize your music.'**
  String get emptyFolderMsg;

  /// No description provided for @enableUpdateChecksDescription.
  ///
  /// In en, this message translates to:
  /// **'Would you like Thennal Music to check for updates automatically from GitHub releases? You can always check for updates manually from the settings'**
  String get enableUpdateChecksDescription;

  /// No description provided for @enterFolderName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a folder name'**
  String get enterFolderName;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Check logs or try again.'**
  String get error;

  /// No description provided for @externalRecommendations.
  ///
  /// In en, this message translates to:
  /// **'External recommendations'**
  String get externalRecommendations;

  /// No description provided for @externalRecommendationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Use the external algorithm for recommendations instead of Thennal Music’s own.'**
  String get externalRecommendationsDescription;

  /// No description provided for @fieldsNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'All fields must be filled'**
  String get fieldsNotEmpty;

  /// No description provided for @folderAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'A folder with this name already exists'**
  String get folderAlreadyExists;

  /// No description provided for @folderDeleted.
  ///
  /// In en, this message translates to:
  /// **'Folder deleted successfully'**
  String get folderDeleted;

  /// No description provided for @folderName.
  ///
  /// In en, this message translates to:
  /// **'Folder name'**
  String get folderName;

  /// No description provided for @folderRestrictions.
  ///
  /// In en, this message translates to:
  /// **'Android restrictions require selecting a backup folder from Downloads or Documents'**
  String get folderRestrictions;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @imagePicked.
  ///
  /// In en, this message translates to:
  /// **'Image selected'**
  String get imagePicked;

  /// No description provided for @invalidYouTubePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Invalid YouTube playlist'**
  String get invalidYouTubePlaylist;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageMsg.
  ///
  /// In en, this message translates to:
  /// **'Language updated successfully'**
  String get languageMsg;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @likedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Liked playlists'**
  String get likedPlaylists;

  /// No description provided for @likedSongs.
  ///
  /// In en, this message translates to:
  /// **'Liked songs'**
  String get likedSongs;

  /// No description provided for @lyrics.
  ///
  /// In en, this message translates to:
  /// **'Lyrics'**
  String get lyrics;

  /// No description provided for @lyricsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Lyrics not available'**
  String get lyricsNotAvailable;

  /// No description provided for @makeOffline.
  ///
  /// In en, this message translates to:
  /// **'Make available offline'**
  String get makeOffline;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @moveToFolder.
  ///
  /// In en, this message translates to:
  /// **'Move to folder'**
  String get moveToFolder;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @newAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'New announcement posted'**
  String get newAnnouncement;

  /// No description provided for @newFolder.
  ///
  /// In en, this message translates to:
  /// **'New folder'**
  String get newFolder;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noCustomPlaylists.
  ///
  /// In en, this message translates to:
  /// **'No custom playlists created yet'**
  String get noCustomPlaylists;

  /// No description provided for @noPlaylistsAdded.
  ///
  /// In en, this message translates to:
  /// **'No playlists added yet'**
  String get noPlaylistsAdded;

  /// No description provided for @noSongsInQueue.
  ///
  /// In en, this message translates to:
  /// **'No songs in queue'**
  String get noSongsInQueue;

  /// No description provided for @notYTlist.
  ///
  /// In en, this message translates to:
  /// **'Invalid YouTube playlist ID'**
  String get notYTlist;

  /// No description provided for @offlineMode.
  ///
  /// In en, this message translates to:
  /// **'Offline mode'**
  String get offlineMode;

  /// No description provided for @offlineModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Disable online features and use Thennal Music completely offline.'**
  String get offlineModeDescription;

  /// No description provided for @offlinePlaylists.
  ///
  /// In en, this message translates to:
  /// **'Offline playlists'**
  String get offlinePlaylists;

  /// No description provided for @offlineSongs.
  ///
  /// In en, this message translates to:
  /// **'Offline songs'**
  String get offlineSongs;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @pickImageFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Pick image from device'**
  String get pickImageFromDevice;

  /// No description provided for @playNext.
  ///
  /// In en, this message translates to:
  /// **'Play next'**
  String get playNext;

  /// No description provided for @playlist.
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get playlist;

  /// No description provided for @playlistAlreadyDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Playlist already downloaded'**
  String get playlistAlreadyDownloaded;

  /// No description provided for @playlistAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Playlist already exists'**
  String get playlistAlreadyExists;

  /// No description provided for @playlistDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Playlist downloaded'**
  String get playlistDownloaded;

  /// No description provided for @playlistEmpty.
  ///
  /// In en, this message translates to:
  /// **'Playlist is empty'**
  String get playlistEmpty;

  /// No description provided for @playlistFolders.
  ///
  /// In en, this message translates to:
  /// **'Playlist folders'**
  String get playlistFolders;

  /// No description provided for @playlistRemovedFromOffline.
  ///
  /// In en, this message translates to:
  /// **'Playlist removed from offline storage'**
  String get playlistRemovedFromOffline;

  /// No description provided for @playlistUpdated.
  ///
  /// In en, this message translates to:
  /// **'Playlist updated successfully'**
  String get playlistUpdated;

  /// No description provided for @playlists.
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlists;

  /// No description provided for @predictiveBack.
  ///
  /// In en, this message translates to:
  /// **'Predictive back (Android 14+)'**
  String get predictiveBack;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @provideIdOrNameError.
  ///
  /// In en, this message translates to:
  /// **'Please provide a YouTube ID or custom playlist name'**
  String get provideIdOrNameError;

  /// No description provided for @pureBlackTheme.
  ///
  /// In en, this message translates to:
  /// **'Pure black theme'**
  String get pureBlackTheme;

  /// No description provided for @queue.
  ///
  /// In en, this message translates to:
  /// **'Queue'**
  String get queue;

  /// No description provided for @recentlyPlayed.
  ///
  /// In en, this message translates to:
  /// **'Recently played'**
  String get recentlyPlayed;

  /// No description provided for @recentlyPlayedMsg.
  ///
  /// In en, this message translates to:
  /// **'Recently played history cleared'**
  String get recentlyPlayedMsg;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get recommendedForYou;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @removeFromFolder.
  ///
  /// In en, this message translates to:
  /// **'Remove from folder'**
  String get removeFromFolder;

  /// No description provided for @removeFromLikedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Remove from liked playlists'**
  String get removeFromLikedPlaylists;

  /// No description provided for @removeFromLikedSongs.
  ///
  /// In en, this message translates to:
  /// **'Remove from liked songs'**
  String get removeFromLikedSongs;

  /// No description provided for @removeFromPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Remove from playlist'**
  String get removeFromPlaylist;

  /// No description provided for @removeFromRecentlyPlayed.
  ///
  /// In en, this message translates to:
  /// **'Remove from recently played'**
  String get removeFromRecentlyPlayed;

  /// No description provided for @removeOffline.
  ///
  /// In en, this message translates to:
  /// **'Remove from offline'**
  String get removeOffline;

  /// No description provided for @removeOfflinePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Remove Offline Playlist'**
  String get removeOfflinePlaylist;

  /// No description provided for @removeOfflinePlaylistConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will remove the playlist from offline storage. Songs that are used in other playlists will still be available.'**
  String get removeOfflinePlaylistConfirm;

  /// No description provided for @removePlaylistQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this playlist?'**
  String get removePlaylistQuestion;

  /// No description provided for @removeSearchQueryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this search query?'**
  String get removeSearchQueryQuestion;

  /// No description provided for @removedFromLikedSongs.
  ///
  /// In en, this message translates to:
  /// **'Removed from liked songs'**
  String get removedFromLikedSongs;

  /// No description provided for @renameSong.
  ///
  /// In en, this message translates to:
  /// **'Rename song'**
  String get renameSong;

  /// No description provided for @restoreError.
  ///
  /// In en, this message translates to:
  /// **'Error restoring data'**
  String get restoreError;

  /// No description provided for @restoreUserData.
  ///
  /// In en, this message translates to:
  /// **'Restore user data'**
  String get restoreUserData;

  /// No description provided for @restoredSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data restored successfully'**
  String get restoredSuccess;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchHistoryMsg.
  ///
  /// In en, this message translates to:
  /// **'Search history cleared'**
  String get searchHistoryMsg;

  /// No description provided for @selectDuration.
  ///
  /// In en, this message translates to:
  /// **'Select duration'**
  String get selectDuration;

  /// No description provided for @setSleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Set sleep timer'**
  String get setSleepTimer;

  /// No description provided for @setTimer.
  ///
  /// In en, this message translates to:
  /// **'Set timer'**
  String get setTimer;

  /// No description provided for @settingChangedMsg.
  ///
  /// In en, this message translates to:
  /// **'Settings updated successfully'**
  String get settingChangedMsg;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @sleepTimerCancelled.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer cancelled'**
  String get sleepTimerCancelled;

  /// No description provided for @sleepTimerSet.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer set'**
  String get sleepTimerSet;

  /// No description provided for @songAdded.
  ///
  /// In en, this message translates to:
  /// **'Song added'**
  String get songAdded;

  /// No description provided for @songAddedToOffline.
  ///
  /// In en, this message translates to:
  /// **'Song is now available offline'**
  String get songAddedToOffline;

  /// No description provided for @songAlreadyInPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Song is already in the playlist'**
  String get songAlreadyInPlaylist;

  /// No description provided for @songRemoved.
  ///
  /// In en, this message translates to:
  /// **'Song removed'**
  String get songRemoved;

  /// No description provided for @songRemovedFromOffline.
  ///
  /// In en, this message translates to:
  /// **'Song is no longer available offline'**
  String get songRemovedFromOffline;

  /// No description provided for @songs.
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get songs;

  /// No description provided for @sponsorBlockDescription.
  ///
  /// In en, this message translates to:
  /// **'Skip sponsored segments in supported tracks.'**
  String get sponsorBlockDescription;

  /// No description provided for @sponsorProject.
  ///
  /// In en, this message translates to:
  /// **'Sponsor the project'**
  String get sponsorProject;

  /// No description provided for @suggestedArtists.
  ///
  /// In en, this message translates to:
  /// **'Suggested artists'**
  String get suggestedArtists;

  /// No description provided for @suggestedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Suggested playlists'**
  String get suggestedPlaylists;

  /// No description provided for @tapToView.
  ///
  /// In en, this message translates to:
  /// **'Tap to view'**
  String get tapToView;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// No description provided for @themeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeModeDark;

  /// No description provided for @themeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeModeLight;

  /// No description provided for @themeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeModeSystem;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @translate.
  ///
  /// In en, this message translates to:
  /// **'Translate'**
  String get translate;

  /// No description provided for @translateDescription.
  ///
  /// In en, this message translates to:
  /// **'Help translate Thennal Music into your language on Crowdin.'**
  String get translateDescription;

  /// No description provided for @understand.
  ///
  /// In en, this message translates to:
  /// **'I understand'**
  String get understand;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @useProxy.
  ///
  /// In en, this message translates to:
  /// **'Use proxy'**
  String get useProxy;

  /// No description provided for @useProxyDescription.
  ///
  /// In en, this message translates to:
  /// **'Use the proxy only when streaming fails, unnecessary use may break playback.'**
  String get useProxyDescription;

  /// No description provided for @userPlaylists.
  ///
  /// In en, this message translates to:
  /// **'User playlists'**
  String get userPlaylists;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @youtubePlaylistLinkOrId.
  ///
  /// In en, this message translates to:
  /// **'YouTube playlist link or ID'**
  String get youtubePlaylistLinkOrId;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'el',
    'en',
    'es',
    'et',
    'fr',
    'he',
    'hi',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'pl',
    'pt',
    'ru',
    'sv',
    'tr',
    'uk',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
