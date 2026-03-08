import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(ColorCode.scaffoldBackground),
  colorScheme: ColorScheme.light(
    primary: Color(ColorCode.orange),
    secondary: Color(ColorCode.white),
  ),
);
