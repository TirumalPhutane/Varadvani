import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/l10n/app_localizations.dart';
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
    return Theme(
      data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
      child: BottomNavigationBar(
        elevation: 10,
        currentIndex: selectedIndex,
        onTap: onItemSelected,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Gotu',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(ColorCode.orange),
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Gotu',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(ColorCode.black),
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: SvgPicture.asset(
                selectedIndex == 0
                    ? 'assets/svg/home_fill.svg'
                    : 'assets/svg/home.svg',
                colorFilter: ColorFilter.mode(
                  Color(
                    selectedIndex == 0 ? ColorCode.orange : ColorCode.black,
                  ),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: SvgPicture.asset(
                selectedIndex == 1
                    ? 'assets/svg/dada_fill.svg'
                    : 'assets/svg/dada.svg',
                width: 24,
              ),
            ),
            label: AppLocalizations.of(context)!.p_dada,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: SvgPicture.asset(
                selectedIndex == 2
                    ? 'assets/svg/appa_fill.svg'
                    : 'assets/svg/appa.svg',
                width: 24,
              ),
            ),
            label: AppLocalizations.of(context)!.p_appa,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: SvgPicture.asset(
                selectedIndex == 3
                    ? 'assets/svg/music_fill.svg'
                    : 'assets/svg/music.svg',
              ),
            ),
            label: AppLocalizations.of(context)!.audio,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: SvgPicture.asset(
                selectedIndex == 4
                    ? 'assets/svg/profile_fill.svg'
                    : 'assets/svg/profile.svg',
                colorFilter: ColorFilter.mode(
                  Color(
                    selectedIndex == 4 ? ColorCode.orange : ColorCode.black,
                  ),
                  BlendMode.srcIn,
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
