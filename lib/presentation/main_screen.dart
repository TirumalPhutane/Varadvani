import 'package:flutter/material.dart';
import 'package:varadvani/presentation/screens/home/dasganu_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/home/exams_screen.dart';
import 'package:varadvani/presentation/screens/home/home_screen.dart';
import 'package:varadvani/presentation/screens/home/profile_screen.dart';
import 'package:varadvani/presentation/screens/home/varadanand_bharati_screen.dart';
import 'package:varadvani/presentation/widgets/bottom_nav_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
