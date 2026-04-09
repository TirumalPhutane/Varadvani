import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/routes/app_routes.dart';
import 'package:varadvani/theme/color_code.dart';

class VaradanandBharatiScreen extends StatefulWidget {
  const VaradanandBharatiScreen({super.key});

  @override
  State<VaradanandBharatiScreen> createState() =>
      _VaradanandBharatiScreenState();
}

class _VaradanandBharatiScreenState extends State<VaradanandBharatiScreen> {
  final List<Map<String, dynamic>> options = [
    {'title': 'पू. अप्पांचा जीवनपट', 'route': AppRoutes.appaJeevanpatScreen},
    {'title': 'संक्षिप्त चरित्र', 'route': AppRoutes.charitraScreen},
    {'title': 'दादा व अप्पा', 'route': AppRoutes.dadaAppaScreen},
    {'title': 'संजीवक चरित्र सारामृत', 'route': AppRoutes.charitraScreen},
    {'title': 'ग्रंथसंपदा', 'route': AppRoutes.appaGranthSampadaScreen},
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
                'ब्रह्मीभूत प. पू. स्वामी वरदानंद भारती (पूर्वाश्रमीचे प्राचार्य अनंतराव आठवले)',
                textAlign: TextAlign.center,
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
                  width: double.infinity,
                  'assets/image/appa.jpg',
                  fit: BoxFit.fitWidth,
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

  Widget _buildListItem(String title, String routeName) {
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
                title,
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
