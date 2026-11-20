import 'dart:math';
import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
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

class _PlayerScreenState extends ConsumerState<PlayerScreen>
    with SingleTickerProviderStateMixin {
  static const double _controlsFraction = 0.42; // fixed share for controls
  static const double _pad = 20;

  double? _dragValue;
  bool _showLyrics = false;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 450),
  );
  late final Animation<double> _t = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutCubic,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLyrics() {
    setState(() => _showLyrics = !_showLyrics);
    _showLyrics ? _controller.forward() : _controller.reverse();
  }

  Future<void> _shareAudio(AudioEntity audio) async {
    final text = '${audio.title}\n${audio.description}\n\n${audio.file}';
    await SharePlus.instance.share(
      ShareParams(text: text, subject: audio.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(audioPlayerProvider);
    final currentAudio = playerState.currentAudio ?? widget.audio;

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
                radius: 20,
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
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, c) {
            final controlsH = c.maxHeight * _controlsFraction;
            final topH = c.maxHeight - controlsH;
            return Column(
              children: [
                SizedBox(
                  height: topH,
                  child: _buildTopSection(currentAudio, c.maxWidth, topH),
                ),
                SizedBox(
                  height: controlsH,
                  child: _buildControls(currentAudio),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopSection(AudioEntity audio, double w, double h) {
    const textBlockH = 84.0;
    const smallArt = 56.0;
    const gap = 16.0;
    const lyricsTop = 4.0 + smallArt + 12;

    final bigArt = (h - textBlockH - gap).clamp(120.0, w - _pad * 2);
    final groupH = bigArt + gap + textBlockH;
    final bigTop = max(0.0, (h - groupH) / 2);
    final lyrics = (audio.lyrics).replaceAll('\r\n', '\n').trim();

    return AnimatedBuilder(
      animation: _t,
      builder: (context, _) {
        final t = _t.value;

        final artSize = lerpDouble(bigArt, smallArt, t)!;
        final artLeft = lerpDouble((w - bigArt) / 2, _pad, t)!;
        final artTop = lerpDouble(bigTop, 4, t)!;

        final textLeft = lerpDouble(_pad, _pad + smallArt + 12, t)!;
        final textTop = artTop + lerpDouble(artSize + gap, 0, t)!;
        final textH = lerpDouble(textBlockH, smallArt, t)!;

        // Lyrics fade in late so they don't overlap the moving artwork
        final lyricsT = Curves.easeIn.transform(
          ((t - 0.35) / 0.65).clamp(0.0, 1.0),
        );

        final textAlign = t < 0.5 ? TextAlign.center : TextAlign.start;
        final hAlign = Alignment.lerp(
          Alignment.center,
          Alignment.centerLeft,
          t,
        )!;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // Lyrics (only built while visible)
            if (t > 0)
              Positioned(
                left: 0,
                right: 0,
                top: lyricsTop,
                bottom: 0,
                child: IgnorePointer(
                  ignoring: !_showLyrics,
                  child: Opacity(
                    opacity: lyricsT,
                    child: Transform.translate(
                      offset: Offset(0, (1 - lyricsT) * 30),
                      child: _buildLyricsContent(lyrics),
                    ),
                  ),
                ),
              ),

            // Artwork
            Positioned(
              left: artLeft,
              top: artTop,
              width: artSize,
              height: artSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(lerpDouble(12, 8, t)!),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25 * (1 - t)),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(lerpDouble(12, 8, t)!),
                  child: Image.network(audio.thumbnail, fit: BoxFit.cover),
                ),
              ),
            ),

            // Title + description
            Positioned(
              left: textLeft,
              right: _pad,
              top: textTop,
              height: textH,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: hAlign,
                    child: Text(
                      audio.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: textAlign,
                      style: TextStyle(
                        fontSize: lerpDouble(20, 16, t),
                        fontFamily: 'Mukta',
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Align(
                    alignment: hAlign,
                    child: Text(
                      audio.description,
                      maxLines: t < 0.5 ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: textAlign,
                      style: TextStyle(
                        fontSize: lerpDouble(16, 13, t),
                        fontFamily: 'Mukta_light',
                        color: context.colors.onSurface.withValues(
                          alpha: lerpDouble(1, 0.7, t)!,
                        ),
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLyricsContent(String lyrics) {
    if (lyrics.isEmpty) {
      return Center(
        child: Text(
          context.l10n.no_lyrics_available,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Mukta_light',
            color: context.colors.onSurface.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    // Soft fade at top and bottom edges
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black,
          Colors.black,
          Colors.transparent,
        ],
        stops: [0.0, 0.06, 0.92, 1.0],
      ).createShader(rect),
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
        key: ValueKey(lyrics), // resets scroll when the song changes
        padding: const EdgeInsets.fromLTRB(_pad, 12, _pad, 32),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            lyrics,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              height: 1.7,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w600,
              color: context.colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  // ───────────────────────── CONTROLS ─────────────────────────

  Widget _buildControls(AudioEntity currentAudio) {
    final playerState = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);

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

    final timeStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'Mukta_light',
      color: context.colors.onSurface.withValues(alpha: 0.7),
      letterSpacing: 0,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(_pad, 0, _pad, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Action row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _actionIcon('assets/svg/favourite.svg', () {}),
              _actionIcon(
                'assets/svg/share.svg',
                () => _shareAudio(currentAudio),
              ),
              _actionIcon('assets/svg/replay.svg', notifier.replay),
              _actionIcon(
                'assets/svg/lyrics.svg',
                _toggleLyrics,
                highlighted: _showLyrics,
              ),
            ],
          ),

          // Slider + times
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  padding: EdgeInsets.zero,
                  value: sliderValue,
                  onChanged: (value) => setState(() => _dragValue = value),
                  onChangeEnd: (value) async {
                    final target = Duration(
                      seconds: (value * totalSeconds).round(),
                    );
                    await notifier.seek(target);
                    if (!mounted) return;
                    setState(() => _dragValue = null);
                  },
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(
                      Duration(seconds: (sliderValue * totalSeconds).round()),
                    ),
                    style: timeStyle,
                  ),
                  Text(
                    _formatDuration(Duration(seconds: totalSeconds)),
                    style: timeStyle,
                  ),
                ],
              ),
            ],
          ),

          // Playback row
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
                  child: _svg('assets/svg/forward.svg', 28),
                ),
              ),
              GestureDetector(
                onTap: notifier.togglePlayPause,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(ColorCode.orange)),
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
                      : _svg(
                          playerState.isPlaying
                              ? 'assets/svg/stop.svg'
                              : 'assets/svg/play.svg',
                          34,
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
                child: _svg('assets/svg/forward.svg', 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _svg(String asset, double width) => SvgPicture.asset(
    asset,
    width: width,
    colorFilter: ColorFilter.mode(Color(ColorCode.orange), BlendMode.srcIn),
  );

  Widget _actionIcon(
    String asset,
    VoidCallback onTap, {
    bool highlighted = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: highlighted
              ? Color(ColorCode.orange).withValues(alpha: 0.15)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: _svg(asset, 28),
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
