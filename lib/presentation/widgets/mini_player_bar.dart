// lib/presentation/widgets/mini_player_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/presentation/providers/audio/audio_player_provider.dart';
import 'package:varadvani/theme/color_code.dart';

class MiniPlayerBar extends ConsumerWidget {
  const MiniPlayerBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);
    final audio = playerState.currentAudio;

    if (audio == null) return const SizedBox.shrink();

    // final progress = playerState.duration.inSeconds > 0
    //     ? playerState.position.inSeconds / playerState.duration.inSeconds
    //     : 0.0;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(ColorCode.lightOrange)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // thin progress line at top of the bar
            // ClipRRect(
            //   borderRadius: const BorderRadius.vertical(
            //     top: Radius.circular(16),
            //   ),
            //   child: LinearProgressIndicator(
            //     value: progress.clamp(0.0, 1.0),
            //     minHeight: 3,
            //     backgroundColor: Color(ColorCode.gray),
            //     valueColor: AlwaysStoppedAnimation<Color>(
            //       Color(ColorCode.orange),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.playerScreen,
                        arguments: audio,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              audio.thumbnail,
                              width: 42,
                              height: 42,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  audio.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Mukta',
                                    fontWeight: FontWeight.w600,
                                    color: Color(ColorCode.black),
                                  ),
                                ),
                                Text(
                                  '${_formatDuration(playerState.position)} / ${_formatDuration(playerState.duration)}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Mukta_light',
                                    color: Color(
                                      ColorCode.black,
                                    ).withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: notifier.togglePlayPause,
                    child: SvgPicture.asset(
                      playerState.isPlaying
                          ? 'assets/svg/stop.svg'
                          : 'assets/svg/play.svg',
                      //width: 24,
                      colorFilter: ColorFilter.mode(
                        Color(ColorCode.orange),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
