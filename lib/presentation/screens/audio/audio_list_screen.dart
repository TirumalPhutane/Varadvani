import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/domain/entities/audio/audio_entity.dart';
import 'package:varadvani/presentation/providers/audio/audio_player_provider.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/mini_player_bar.dart';
import 'package:varadvani/theme/color_code.dart';

class AudioListScreen extends ConsumerStatefulWidget {
  const AudioListScreen({
    super.key,
    required this.category,
    required this.items,
  });

  final String category;
  final List<AudioEntity> items;

  @override
  ConsumerState<AudioListScreen> createState() => _AudioListScreenState();
}

class _AudioListScreenState extends ConsumerState<AudioListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.category),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ${widget.items.length} Audios',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Mukta_light',
                      color: Color(ColorCode.black),
                      letterSpacing: 0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        final audio = widget.items[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: buildCard(audio),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const MiniPlayerBar(),
        ],
      ),
    );
  }

  Widget buildCard(AudioEntity audio) {
    final playerState = ref.watch(audioPlayerProvider);
    //final isCurrentAudio = playerState.currentAudio?.file == audio.file;
    final isCurrentlyPlaying =
        playerState.currentAudio?.file == audio.file && playerState.isPlaying;

    return GestureDetector(
      onTap: () async {
        ref.read(audioPlayerProvider.notifier).playAudio(audio, widget.items);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(ColorCode.white),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  audio.thumbnail,
                  width: 45,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      audio.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mukta',
                        color: Color(ColorCode.black),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      _formatDuration(Duration(seconds: audio.duration)),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mukta_light',
                        color: Color(ColorCode.black),
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              SvgPicture.asset(
                isCurrentlyPlaying
                    ? 'assets/svg/stop.svg'
                    : 'assets/svg/play.svg',
                //width: 18,
                colorFilter: ColorFilter.mode(
                  Color(ColorCode.orange),
                  BlendMode.srcIn,
                ),
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
