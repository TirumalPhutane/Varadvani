import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/domain/entities/audio/audio_entity.dart';
import 'package:varadvani/presentation/providers/audio/audio_player_provider.dart';
import 'package:varadvani/presentation/widgets/snackbar_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({super.key, required this.audio});

  final AudioEntity audio;

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> {
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);

    final currentAudio = playerState.currentAudio ?? widget.audio;
    final totalSeconds = playerState.duration.inSeconds > 0
        ? playerState.duration.inSeconds
        : currentAudio.duration;
    final positionSeconds = playerState.position.inSeconds;

    final sliderValue =
        _dragValue ??
        (totalSeconds > 0 ? positionSeconds / totalSeconds : 0.0).clamp(
          0.0,
          1.0,
        );

    return Scaffold(
      backgroundColor: context.theme.cardColor,
      appBar: AppBar(
        backgroundColor: context.theme.cardColor,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              customBorder: const CircleBorder(),
              child: CircleAvatar(
                radius: 20, // diameter = 40
                backgroundColor: context.colors.onSurface.withValues(
                  alpha: 0.06,
                ),
                child: SvgPicture.asset(
                  'assets/svg/down_arrow.svg',
                  width: 10,
                  height: 10,
                  colorFilter: ColorFilter.mode(
                    context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  currentAudio.thumbnail,
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 25),
              Text(
                currentAudio.title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Mukta',
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                ),
              ),
              SizedBox(height: 5),
              Text(
                currentAudio.description,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Mukta_light',
                  color: context.colors.onSurface,
                  letterSpacing: 0,
                ),
              ),
              SizedBox(height: 45),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/svg/favourite.svg',
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      Color(ColorCode.orange),
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svg/share.svg',
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      Color(ColorCode.orange),
                      BlendMode.srcIn,
                    ),
                  ),
                  GestureDetector(
                    onTap: notifier.replay,
                    child: SvgPicture.asset(
                      'assets/svg/replay.svg',
                      width: 28,
                      colorFilter: ColorFilter.mode(
                        Color(ColorCode.orange),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svg/lyrics.svg',
                    width: 28,
                    colorFilter: ColorFilter.mode(
                      Color(ColorCode.orange),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 6,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 7,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 16,
                  ),
                  activeTrackColor: Color(ColorCode.orange),
                  inactiveTrackColor:
                      context.theme.brightness == Brightness.dark
                      ? Color(ColorCode.darkGray)
                      : Color(ColorCode.gray),
                  thumbColor: Color(ColorCode.orange),
                ),
                child: Slider(
                  padding: EdgeInsets.all(0),
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() => _dragValue = value);
                  },
                  onChangeEnd: (value) async {
                    final target = Duration(
                      seconds: (value * totalSeconds).round(),
                    );
                    await notifier.seek(target);
                    setState(() => _dragValue = null);
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(
                      Duration(seconds: (sliderValue * totalSeconds).round()),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Mukta_light',
                      color: context.colors.onSurface.withValues(alpha: 0.7),
                      letterSpacing: 0,
                    ),
                  ),
                  Text(
                    _formatDuration(Duration(seconds: totalSeconds)),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Mukta_light',
                      color: context.colors.onSurface.withValues(alpha: 0.7),
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (playerState.hasPrevious) {
                        notifier.playPrevious();
                      } else {
                        SnackbarHelper.show(
                          context: context,
                          message:
                              'You\'re already at the first audio in the playlist.',
                        );
                      }
                    },
                    child: Transform.rotate(
                      angle: pi,
                      child: SvgPicture.asset(
                        'assets/svg/forward.svg',
                        width: 28,
                        colorFilter: ColorFilter.mode(
                          Color(ColorCode.orange),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: notifier.togglePlayPause,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(ColorCode.orange),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: playerState.isLoading
                          ? SizedBox(
                              width: 34,
                              height: 34,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(ColorCode.orange),
                              ),
                            )
                          : SvgPicture.asset(
                              playerState.isPlaying
                                  ? 'assets/svg/stop.svg'
                                  : 'assets/svg/play.svg',
                              width: 34,
                              colorFilter: ColorFilter.mode(
                                Color(ColorCode.orange),
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (playerState.hasNext) {
                        notifier.playNext();
                      } else {
                        SnackbarHelper.show(
                          context: context,
                          message:
                              'You\'ve reached the last audio in the playlist.',
                        );
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/svg/forward.svg',
                      width: 28,
                      colorFilter: ColorFilter.mode(
                        Color(ColorCode.orange),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
