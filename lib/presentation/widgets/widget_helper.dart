import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
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

  static Widget buildStartText() {
    return Column(
      spacing: 5,
      children: [
        Text(
          'ॐ श्री 卐',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
            color: Color(ColorCode.orange),
            //height: 1.7,
          ),
        ),
        Text(
          'll श्रीशंकर ll',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
            color: Color(ColorCode.orange),
            //height: 1.7,
          ),
        ),
      ],
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

  static Widget buildButtonWithoutText(
    BuildContext context,
    Widget body,
    String routeName,
  ) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
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
      ),
    );
  }

  static Widget buildNormalText(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 18,
      fontFamily: 'Mukta',
      color: Color(ColorCode.black),
      letterSpacing: 0,
      height: 1.5,
    ),
  );

  static Widget tableHeader(
    TableData row,
    double firstWidth,
    double secondWidth,
    double thirdWidth,
  ) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(firstWidth),
        1: FlexColumnWidth(secondWidth),
        2: FlexColumnWidth(thirdWidth),
      },
      children: [
        TableRow(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(ColorCode.darkGray).withValues(alpha: 0.2),
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 0.8,
                ),
                color: Color(ColorCode.white),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Center(
                child: Text(
                  row.first,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.black),
                    //height: 1.7,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(ColorCode.white),
                border: Border.all(
                  color: Color(ColorCode.darkGray).withValues(alpha: 0.2),
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 0.8,
                ),
              ),
              // color: context.colorScheme.onSecondary,
              //margin: const EdgeInsets.only(right: 4, left: 4),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Center(
                child: Text(
                  row.second,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.black),
                    //height: 1.7,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(ColorCode.darkGray).withValues(alpha: 0.2),
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 0.8,
                ),
                color: Color(ColorCode.white),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Center(
                child: Text(
                  row.third,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.black),
                    //height: 1.7,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget buildTable(
    TableData row,
    double firstWidth,
    double secondWidth,
    double thirdWidth,
  ) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      columnWidths: {
        0: FlexColumnWidth(firstWidth),
        1: FlexColumnWidth(secondWidth),
        2: FlexColumnWidth(thirdWidth),
      },
      children: [
        TableRow(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  row.first,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 15),
                child: Text(
                  row.second,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  row.third,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
