import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({
    super.key,
    required this.context,
    required this.hintText,
    required this.controller,
    required this.onCountryChanged,
    this.initialCountry = 'IN',
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

  final BuildContext context;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<CountryCode> onCountryChanged;
  final String initialCountry;
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
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          height: 60,
          decoration: BoxDecoration(
            color: Color(ColorCode.orange).withValues(alpha: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(ColorCode.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: CountryCodePicker(
                  onChanged: onCountryChanged,
                  initialSelection: initialCountry,
                  favorite: const ['+91', 'IN'],
                  builder: (CountryCode? code) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 5,
                        children: [
                          Image.asset(
                            code?.flagUri ?? 'flags/in.png',
                            package: 'country_code_picker',
                            width: 24,
                            height: 16,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            code?.dialCode ?? '+91',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Mukta_medium',
                              fontWeight: FontWeight.w500,
                              color: Color(
                                ColorCode.black,
                              ).withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w600,
                    color: Color(ColorCode.black),
                  ),
                  flagWidth: 24,
                  headerTextStyle: TextStyle(
                    fontFamily: 'Mukta',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.black),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  maxLines: maxLines,
                  onChanged: onChanged,
                  validator: validator,
                  onTap: onTap,
                  readOnly: readOnly,
                  maxLength: maxLength,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
