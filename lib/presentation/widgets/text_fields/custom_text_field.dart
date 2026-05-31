import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.contentPadding,
    this.maxLength,
  });

  final String hintText;
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Mukta_medium',
            fontWeight: FontWeight.normal,
            color: Color(ColorCode.black),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 2,
            right: 2,
            top: suffixIcon != null ? 14 : 5,
            bottom: 5,
          ),
          height: 60,
          decoration: BoxDecoration(
            color: Color(ColorCode.orange).withValues(alpha: 0.17),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            onChanged: onChanged,
            validator: validator,
            onTap: onTap,
            readOnly: readOnly,
            style: TextStyle(
              color: Color(ColorCode.black),
              fontSize: 16,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(ColorCode.black).withValues(alpha: 0.5),
                fontSize: 16,
                fontFamily: 'Mukta',
                fontWeight: FontWeight.w500,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
