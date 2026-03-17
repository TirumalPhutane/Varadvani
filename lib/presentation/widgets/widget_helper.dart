import 'package:flutter/material.dart';
import 'package:varadvani/theme/color_code.dart';

class WidgetHelper {
  static Widget buildHeader(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Gotu',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(ColorCode.black),
          ),
        ),
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Color(ColorCode.orange),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildRichText(
    String firstText,
    String secondText,
    TextStyle firstTextStyle,
    TextStyle secondTextStyle,
  ) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: firstText, style: firstTextStyle),
          TextSpan(text: secondText, style: secondTextStyle),
        ],
      ),
    );
  }

  static Widget buildCard(Widget body) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(ColorCode.white),
        boxShadow: [
          BoxShadow(
            color: Color(ColorCode.black).withValues(alpha: 0.04),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(10), child: body),
    );
  }

  static Widget buildButtonWithoutText(Widget body) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        color: Color(ColorCode.orange),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(5), child: body),
    );
  }
}
