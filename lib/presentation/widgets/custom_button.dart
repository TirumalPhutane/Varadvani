import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.color,
    required this.title,
    this.titleColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
  });

  final GestureTapCallback? onPressed;
  final int? color;
  final String title;
  final Color? titleColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    //final bool isDisabled = onPressed == null;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(color ?? ColorCode.orange),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w600,
              color: titleColor ?? Color(ColorCode.white),
            ),
          ),
        ),
      ),
    );
  }
}
