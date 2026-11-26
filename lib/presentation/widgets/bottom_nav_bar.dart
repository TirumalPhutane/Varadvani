import 'package:feature_discovery/feature_discovery.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/core/helper/guide_ids.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/guide_overlay.dart';
import 'package:varadvani/theme/color_code.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.colors.brightness == Brightness.dark;
    return Theme(
      data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
      child: BottomNavigationBar(
        elevation: 10,
        currentIndex: selectedIndex,
        onTap: onItemSelected,
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.theme.cardColor,
        selectedItemColor: Color(ColorCode.orange),
        unselectedItemColor: context.colors.onSurface,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Gotu',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(ColorCode.orange), //context.colors.primary,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Gotu',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: context.colors.onSurface,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GuideOverlay(
                featureId: GuideIds.home,
                title: context.l10n.home,
                description: context.l10n.guide_home_desc,
                contentLocation: ContentLocation.above,
                tapTarget: SvgPicture.asset(
                  'assets/svg/home_fill.svg',
                  colorFilter: ColorFilter.mode(
                    Color(ColorCode.orange),
                    BlendMode.srcIn,
                  ),
                ),
                child: SvgPicture.asset(
                  selectedIndex == 0
                      ? 'assets/svg/home_fill.svg'
                      : 'assets/svg/home.svg',
                  colorFilter: ColorFilter.mode(
                    selectedIndex == 0
                        ? context.colors.primary
                        : context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GuideOverlay(
                featureId: GuideIds.dada,
                title: context.l10n.p_dada,
                description: context.l10n.guide_dada_desc,
                contentLocation: ContentLocation.above,
                tapTarget: Image.asset(
                  'assets/image/dada_orange.png',
                  width: 26,
                  height: 26,
                ),
                child: Image.asset(
                  selectedIndex == 1
                      ? 'assets/image/dada_selected.png'
                      : isDark
                      ? 'assets/image/dada_dark.png'
                      : 'assets/image/dada.png',
                  width: 26,
                  height: 26,
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.p_dada,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GuideOverlay(
                featureId: GuideIds.appa,
                title: context.l10n.p_appa,
                description: context.l10n.guide_appa_desc,
                contentLocation: ContentLocation.above,
                tapTarget: Image.asset(
                  'assets/image/appa_orange.png',
                  width: 26,
                  height: 26,
                ),
                child: Image.asset(
                  selectedIndex == 2
                      ? 'assets/image/appa_selected.png'
                      : isDark
                      ? 'assets/image/appa_dark.png'
                      : 'assets/image/appa.png',
                  width: 26,
                  height: 26,
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.p_appa,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GuideOverlay(
                featureId: GuideIds.audio,
                title: context.l10n.audio,
                description: context.l10n.guide_audio_desc,
                contentLocation: ContentLocation.above,
                tapTarget: SvgPicture.asset(
                  'assets/svg/music_fill.svg',
                  colorFilter: ColorFilter.mode(
                    Color(ColorCode.orange),
                    BlendMode.srcIn,
                  ),
                ),
                child: SvgPicture.asset(
                  selectedIndex == 3
                      ? 'assets/svg/music.svg'
                      : 'assets/svg/music.svg',
                  colorFilter: ColorFilter.mode(
                    selectedIndex == 3
                        ? context.colors.primary
                        : context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.audio,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GuideOverlay(
                featureId: GuideIds.profile,
                title: context.l10n.profile,
                description: context.l10n.guide_profile_desc,
                contentLocation: ContentLocation.above,
                tapTarget: SvgPicture.asset(
                  'assets/svg/profile_fill.svg',
                  colorFilter: ColorFilter.mode(
                    Color(ColorCode.orange),
                    BlendMode.srcIn,
                  ),
                ),
                child: SvgPicture.asset(
                  selectedIndex == 4
                      ? 'assets/svg/profile_fill.svg'
                      : 'assets/svg/profile.svg',
                  colorFilter: ColorFilter.mode(
                    selectedIndex == 4
                        ? context.colors.primary
                        : context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
