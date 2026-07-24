import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/screens/audio/appa_audio_screen.dart';
import 'package:varadvani/presentation/screens/audio/dada_audio_screen.dart';
import 'package:varadvani/presentation/screens/audio/other_audio_screen.dart';
import 'package:varadvani/presentation/widgets/mini_player_bar.dart';
import 'package:varadvani/theme/color_code.dart';

class AudiosScreen extends StatefulWidget {
  const AudiosScreen({super.key});

  @override
  State<AudiosScreen> createState() => _AudiosScreenState();
}

class _AudiosScreenState extends State<AudiosScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(ColorCode.white),
            ),
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Color(ColorCode.black),
              labelColor: Color(ColorCode.white),
              labelStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'Mukta',
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Mukta',
                fontWeight: FontWeight.w400,
              ),
              overlayColor: WidgetStatePropertyAll(
                Color(ColorCode.scaffoldBackground),
              ),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(ColorCode.orange),
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 10),
                  child: Text(AppLocalizations.of(context)!.p_dada),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 10),
                  child: Text(AppLocalizations.of(context)!.p_appa),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 10),
                  child: Text(AppLocalizations.of(context)!.other),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              DadaAudioScreen(),
              AppaAudioScreen(),
              OtherAudioScreen(),
            ],
          ),
        ),
        const MiniPlayerBar(),
      ],
    );
  }
}
