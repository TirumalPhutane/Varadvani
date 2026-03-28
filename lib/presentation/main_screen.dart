import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/screens/home/dasganu_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/home/exams_screen.dart';
import 'package:varadvani/presentation/screens/home/home_screen.dart';
import 'package:varadvani/presentation/screens/home/profile_screen.dart';
import 'package:varadvani/presentation/screens/home/varadanand_bharati_screen.dart';
import 'package:varadvani/presentation/widgets/bottom_nav_bar.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/main_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    DasganuMaharajScreen(),
    VaradanandBharatiScreen(),
    ExamsScreen(),
    ProfileScreen(),
  ];

  List<String> _screenTitles(BuildContext context) {
    return [
      AppLocalizations.of(context)!.title,
      AppLocalizations.of(context)!.p_dada,
      AppLocalizations.of(context)!.p_appa,
      AppLocalizations.of(context)!.exams,
      AppLocalizations.of(context)!.profile,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => SystemNavigator.pop(),
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: CustomAppBar(
          title: _screenTitles(context)[_selectedIndex],
          isFromHome: _selectedIndex == 0 ? true : false,
          isShowLeading: true,
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
