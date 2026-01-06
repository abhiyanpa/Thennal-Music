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
import 'package:thennal_music/services/settings_manager.dart';
import 'package:thennal_music/widgets/section_header.dart';
import 'package:thennal_music/widgets/song_bar.dart';

class RelatedSongsSection extends StatefulWidget {
  const RelatedSongsSection({
    super.key,
    required this.songYtId,
  });

  final String songYtId;

  @override
  State<RelatedSongsSection> createState() => _RelatedSongsSectionState();
}

class _RelatedSongsSectionState extends State<RelatedSongsSection> {
  List<dynamic>? _relatedSongs;
  bool _isLoading = false;
  String? _currentSongId;

  @override
  void initState() {
    super.initState();
    // Delay loading to avoid blocking UI during song transitions
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _loadRelatedSongs();
      }
    });
  }

  @override
  void didUpdateWidget(RelatedSongsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.songYtId != oldWidget.songYtId) {
      // Delay loading to avoid blocking UI during song transitions
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _loadRelatedSongs();
        }
      });
    }
  }

  Future<void> _loadRelatedSongs() async {
    if (_currentSongId == widget.songYtId) return;
    
    _currentSongId = widget.songYtId;
    
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final songs = await getRelatedSongs(widget.songYtId, limit: 8);
      if (mounted && _currentSongId == widget.songYtId) {
        setState(() {
          _relatedSongs = songs;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted && _currentSongId == widget.songYtId) {
        setState(() {
          _relatedSongs = [];
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          ValueListenableBuilder<bool>(
            valueListenable: playNextSongAutomatically,
            builder: (context, autoPlayEnabled, _) {
              return SectionHeader(
                title: 'Related Songs',
                icon: FluentIcons.music_note_2_24_filled,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FluentIcons.arrow_autofit_down_20_filled,
                      size: 16,
                      color: autoPlayEnabled
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      autoPlayEnabled ? 'Auto-play On' : 'Auto-play Off',
                      style: TextStyle(
                        fontSize: 12,
                        color: autoPlayEnabled
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(24),
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else if (_relatedSongs == null || _relatedSongs!.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'No related songs found',
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 14,
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _relatedSongs!.length,
              padding: const EdgeInsets.only(bottom: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: SongBar(
                    _relatedSongs![index],
                    true,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
