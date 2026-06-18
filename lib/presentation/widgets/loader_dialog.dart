import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:varadvani/theme/color_code.dart';

class LoaderDialog {
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _LoaderDialog(message: message),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _LoaderDialog extends StatelessWidget {
  final String? message;

  const _LoaderDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    strokeWidth: 2,
                    colors: const [
                      Color(ColorCode.orange),
                      Color(ColorCode.red),
                    ],
                  ),
                ),
                if (message != null && message!.isNotEmpty) ...[
                  Text(
                    message!,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w500,
                      color: Color(ColorCode.black),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
