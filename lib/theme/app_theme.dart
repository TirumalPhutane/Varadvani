import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: Color(ColorCode.scaffoldBackground),
      primaryColor: Color(ColorCode.orange),
      colorScheme: ColorScheme.light(
        primary: Color(ColorCode.orange),
        secondary: Color(ColorCode.lightOrange),
        error: Color(ColorCode.red),
        surface: Color(ColorCode.white),
        onSurface: Color(ColorCode.black),
      ),
      cardTheme: CardThemeData(color: Color(ColorCode.white), elevation: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(ColorCode.white),
        foregroundColor: Color(ColorCode.black),
        elevation: 0,
      ),
      dividerColor: Color(ColorCode.lightGray),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Color(ColorCode.black),
        displayColor: Color(ColorCode.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
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
          color: Color(ColorCode.black),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: Color(ColorCode.scaffoldBackgroundDark),
      primaryColor: Color(ColorCode.orange),
      colorScheme: ColorScheme.dark(
        primary: Color(ColorCode.orange),
        secondary: Color(ColorCode.lightOrange),
        error: Color(ColorCode.red),
        surface: Color(ColorCode.cardDark),
        onSurface: Color(ColorCode.white),
      ),
      cardTheme: CardThemeData(color: Color(ColorCode.cardDark), elevation: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(ColorCode.cardDark),
        foregroundColor: Color(ColorCode.white),
        elevation: 0,
      ),
      dividerColor: Color(ColorCode.darkGray),
      textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Color(ColorCode.white),
        displayColor: Color(ColorCode.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
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
          color: Color(ColorCode.white),
        ),
      ),
    );
  }
}
