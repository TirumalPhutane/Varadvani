import 'package:flutter/material.dart';
import 'package:varadvani/presentation/widgets/custom_button.dart';
import 'package:varadvani/theme/color_code.dart';

class CommanDialog {
  static void show(
    BuildContext context, {
    required String message,
    required String positiveButtonText,
    required String negativeButtonText,
    required VoidCallback onPositivePressed,
    required VoidCallback onNegativePressed,
    int? positiveButtonColor,
    Color? negativeButtonColor,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => _CommanDialog(
        message: message,
        positiveButtonText: positiveButtonText,
        negativeButtonText: negativeButtonText,
        onPositivePressed: onPositivePressed,
        onNegativePressed: onNegativePressed,
        positiveButtonColor: positiveButtonColor,
        negativeButtonColor: negativeButtonColor,
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _CommanDialog extends StatelessWidget {
  const _CommanDialog({
    required this.message,
    required this.positiveButtonText,
    required this.negativeButtonText,
    required this.onPositivePressed,
    required this.onNegativePressed,
    this.positiveButtonColor,
    this.negativeButtonColor,
  });

  final String message;
  final String positiveButtonText;
  final String negativeButtonText;
  final VoidCallback onPositivePressed;
  final VoidCallback onNegativePressed;
  final int? positiveButtonColor;
  final Color? negativeButtonColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          spacing: 25,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Mukta',
                fontWeight: FontWeight.w700,
                color: Color(ColorCode.black),
                letterSpacing: 0,
              ),
            ),
            Column(
              spacing: 15,
              children: [
                CustomButton(
                  color: positiveButtonColor,
                  borderRadius: 15,
                  onPressed: onPositivePressed,
                  title: positiveButtonText,
                ),
                CustomButton(
                  borderColor: negativeButtonColor ?? Color(ColorCode.orange),
                  borderWidth: 1,
                  color: ColorCode.white,
                  onPressed: onNegativePressed,
                  title: negativeButtonText,
                  titleColor: negativeButtonColor ?? Color(ColorCode.orange),
                  borderRadius: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
