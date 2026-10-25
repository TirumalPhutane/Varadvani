import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/presentation/providers/audio/audio_player_provider.dart';
import 'package:varadvani/presentation/screens/audio/player_screen.dart';
import 'package:varadvani/theme/color_code.dart';

class MiniPlayerBar extends ConsumerWidget {
  const MiniPlayerBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);
    final audio = playerState.currentAudio;

    if (audio == null) return const SizedBox.shrink();

    void openPlayer(BuildContext context) {
      openFullScreenPlayer(context, PlayerScreen(audio: audio));
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(ColorCode.lightOrange)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => openPlayer(context),
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

void openFullScreenPlayer(BuildContext context, Widget screen) {
  Navigator.of(context, rootNavigator: true).push(
    PageRouteBuilder(
      opaque: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        );
      },
    ),
  );
}
