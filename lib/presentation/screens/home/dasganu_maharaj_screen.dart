import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/routes/app_routes.dart';
import 'package:varadvani/theme/color_code.dart';

class DasganuMaharajScreen extends StatefulWidget {
  const DasganuMaharajScreen({super.key});

  @override
  State<DasganuMaharajScreen> createState() => _DasganuMaharajScreenState();
}

class _DasganuMaharajScreenState extends State<DasganuMaharajScreen> {
  final List<Map<String, dynamic>> options = [
    {'title': 'पू. दादांचा जीवनपट', 'route': AppRoutes.poorvardhaScreen},
    {'title': 'पूर्वार्ध', 'route': AppRoutes.poorvardhaScreen},
    {'title': 'गुरु-शिष्य', 'route': AppRoutes.guruShishyaScreen},
    {'title': 'दादा व अप्पा', 'route': AppRoutes.dadaAppaScreen},
    {'title': 'उत्तरार्ध', 'route': AppRoutes.uttarardhaScreen},
    {'title': 'ग्रंथसंपदा', 'route': AppRoutes.poorvardhaScreen},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 10,
          bottom: 20,
        ),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetHelper.buildStartText(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'आधुनिक महिपती संतकवी श्री दासगणू महाराज',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Mukta_medium',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                  color: Color(ColorCode.black),
                ),
              ),
            ),
            WidgetHelper.buildCard(
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
                child: Image.asset(
                  //height: 400,
                  'assets/image/dasganu2.jpg',
                  //fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(),
            Column(
              spacing: 15,
              children: options.map((option) {
                return _buildListItem(option['title'], option['route']);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String option, String routeName) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(ColorCode.white),
          boxShadow: [
            BoxShadow(
              color: Color(ColorCode.black).withValues(alpha: 0.04),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                option,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Mukta',
                  color: Color(ColorCode.black),
                  letterSpacing: 0,
                  height: 1.5,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/arrow.svg',
                colorFilter: ColorFilter.mode(
                  Color(ColorCode.black),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
