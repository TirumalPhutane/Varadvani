import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/domain/entities/audio/audio_entity.dart';
import 'package:varadvani/domain/entities/audio/shravya_entity.dart';
import 'package:varadvani/presentation/providers/audio/audio_player_provider.dart';
import 'package:varadvani/presentation/providers/audio/get_shravya_list_provider.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/mini_player_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class ShravyaListScreen extends ConsumerStatefulWidget {
  const ShravyaListScreen({super.key, required this.shravyaData});

  final ShravyaEntity shravyaData;

  @override
  ConsumerState<ShravyaListScreen> createState() => _ShravyaListScreenState();
}

class _ShravyaListScreenState extends ConsumerState<ShravyaListScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(getShravyaListProvider.notifier)
          .getShravyaAudioList(widget.shravyaData.subCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    final shravyaListState = ref.watch(getShravyaListProvider);

    return Scaffold(
      appBar: CustomAppBar(title: widget.shravyaData.subCategory),
      body: shravyaListState.isLoading
          ? Center(child: WidgetHelper.buildLoader())
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ${widget.shravyaData.count} Audios',
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
                            itemCount: shravyaListState.data!.data.length,
                            itemBuilder: (context, index) {
                              final audio = shravyaListState.data!.data.reversed
                                  .toList()[index];

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
    final shravyaListState = ref.watch(getShravyaListProvider);
    //final isCurrentAudio = playerState.currentAudio?.file == audio.file;
    final isCurrentlyPlaying =
        playerState.currentAudio?.file == audio.file && playerState.isPlaying;

    return GestureDetector(
      onTap: () async {
        ref
            .read(audioPlayerProvider.notifier)
            .playAudio(audio, shravyaListState.data!.data);
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
