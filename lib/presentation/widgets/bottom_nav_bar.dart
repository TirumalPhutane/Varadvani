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
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(ColorCode.orange),
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Gotu',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(ColorCode.black),
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
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
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                selectedIndex == 1
                    ? 'assets/image/dada_selected.PNG'
                    : 'assets/image/dada.PNG',
                width: 26,
                height: 26,
              ),
            ),
            label: AppLocalizations.of(context)!.p_dada,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                selectedIndex == 2
                    ? 'assets/image/appa_selected.PNG'
                    : 'assets/image/appa.PNG',
                width: 26,
                height: 26,
              ),
            ),
            label: AppLocalizations.of(context)!.p_appa,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset(
                selectedIndex == 3
                    ? 'assets/svg/exams_fill.svg'
                    : 'assets/svg/exams.svg',
                colorFilter: ColorFilter.mode(
                  Color(
                    selectedIndex == 3 ? ColorCode.orange : ColorCode.black,
                  ),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: AppLocalizations.of(context)!.exams,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
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
