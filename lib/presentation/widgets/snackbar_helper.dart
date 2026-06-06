import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class SnackbarHelper {
  static void show({
    required BuildContext context,
    required String message,
    Color backgroundColor = const Color(ColorCode.orange),
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w600,
            color: Color(ColorCode.white),
          ),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
