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
    showDialog(
      context: context,
      barrierDismissible: true,
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
    return PopScope(
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: AlertDialog(
          backgroundColor: Color(ColorCode.white),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Mukta_medium',
                  fontWeight: FontWeight.w500,
                  color: Color(ColorCode.black),
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              spacing: 25,
              children: [
                Expanded(
                  child: CustomButton(
                    borderColor: negativeButtonColor ?? Color(ColorCode.orange),
                    borderWidth: 1,
                    color: ColorCode.white,
                    onPressed: onNegativePressed,
                    title: negativeButtonText,
                    titleColor: negativeButtonColor ?? Color(ColorCode.orange),
                    borderRadius: 6,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    color: positiveButtonColor,
                    borderRadius: 6,
                    onPressed: onPositivePressed,
                    title: positiveButtonText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
