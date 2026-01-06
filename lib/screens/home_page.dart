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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:thennal_music/API/thennal_api.dart';
import 'package:thennal_music/extensions/l10n.dart';
import 'package:thennal_music/main.dart';
import 'package:thennal_music/screens/playlist_page.dart';
import 'package:thennal_music/services/settings_manager.dart';
import 'package:thennal_music/utilities/async_loader.dart';
import 'package:thennal_music/utilities/common_variables.dart';
import 'package:thennal_music/utilities/utils.dart';
import 'package:thennal_music/widgets/announcement_box.dart';
import 'package:thennal_music/widgets/playlist_cube.dart';
import 'package:thennal_music/widgets/section_header.dart';
import 'package:thennal_music/widgets/song_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final playlistHeight = MediaQuery.sizeOf(context).height * 0.25 / 1.1;
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary.withOpacity(0.12),
                      theme.colorScheme.tertiary.withOpacity(0.08),
                      theme.colorScheme.surface.withOpacity(0.95),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.primary.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.music_note_rounded,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Thennal Music',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontFamily: 'paytoneOne',
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
            ),
          ),
          SliverPadding(
            padding: commonSingleChildScrollViewPadding,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ValueListenableBuilder<String?>(
                  valueListenable: announcementURL,
                  builder: (_, _url, __) {
                    if (_url == null) return const SizedBox.shrink();

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AnnouncementBox(
                        message: context.l10n!.newAnnouncement,
                        url: _url,
                        onDismiss: () async {
                          announcementURL.value = null;
                        },
                      ),
                    );
                  },
                ),
                _buildSuggestedPlaylists(playlistHeight),
                _buildSuggestedPlaylists(playlistHeight, showOnlyLiked: true),
                _buildRecommendedSongsSection(playlistHeight),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedPlaylists(
    double playlistHeight, {
    bool showOnlyLiked = false,
  }) {
    final sectionTitle = showOnlyLiked
        ? context.l10n!.backToFavorites
        : context.l10n!.suggestedPlaylists;
    return AsyncLoader<List<dynamic>>(
      future: getPlaylists(
        playlistsNum: recommendedCubesNumber,
        onlyLiked: showOnlyLiked,
      ),

      builder: (context, playlists) {
        final itemsNumber = playlists.length.clamp(0, recommendedCubesNumber);
        final isLargeScreen = MediaQuery.of(context).size.width > 480;

        return Column(
          children: [
            SectionHeader(
              title: sectionTitle,
              icon: showOnlyLiked
                  ? FluentIcons.heart_24_filled
                  : FluentIcons.list_24_filled,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: playlistHeight),
              child: isLargeScreen
                  ? _buildHorizontalList(playlists, itemsNumber, playlistHeight)
                  : _buildCarouselView(playlists, itemsNumber, playlistHeight),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHorizontalList(
    List<dynamic> playlists,
    int itemCount,
    double height,
  ) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final playlist = playlists[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PlaylistPage(playlistId: playlist['ytid']),
              ),
            ),
            child: PlaylistCube(playlist, size: height),
          ),
        );
      },
    );
  }

  Widget _buildCarouselView(
    List<dynamic> playlists,
    int itemCount,
    double height,
  ) {
    return CarouselView.weighted(
      flexWeights: const <int>[3, 2, 1],
      itemSnapping: true,
      onTap: (index) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PlaylistPage(playlistId: playlists[index]['ytid']),
        ),
      ),
      children: List.generate(itemCount, (index) {
        return PlaylistCube(playlists[index], size: height * 2);
      }),
    );
  }

  Widget _buildRecommendedSongsSection(double playlistHeight) {
    return AsyncLoader<List<dynamic>>(
      future: getRecommendedSongs(),

      builder: (context, data) {
        final list = data.cast<dynamic>();
        if (list.isEmpty) return const SizedBox.shrink();
        return _buildRecommendedForYouSection(context, list);
      },
    );
  }

  Widget _buildRecommendedForYouSection(
    BuildContext context,
    List<dynamic> data,
  ) {
    final recommendedTitle = context.l10n!.recommendedForYou;

    return Column(
      children: [
        SectionHeader(
          title: recommendedTitle,
          icon: FluentIcons.sparkle_24_filled,
          actionButton: IconButton(
            onPressed: () async {
              await Future.microtask(
                () => audioHandler.playPlaylistSong(
                  playlist: {'title': recommendedTitle, 'list': data},
                  songIndex: 0,
                ),
              );
            },
            icon: Icon(
              FluentIcons.play_circle_24_filled,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          padding: commonListViewBottmomPadding,
          itemBuilder: (context, index) {
            final borderRadius = getItemBorderRadius(index, data.length);
            return RepaintBoundary(
              key: ValueKey('song_${data[index]['ytid']}'),
              child: SongBar(data[index], true, borderRadius: borderRadius),
            );
          },
        ),
      ],
    );
  }
}
