import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/routes/app_routes.dart';
import 'package:varadvani/theme/color_code.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          spacing: 30,
          children: [
            Column(
              children: [
                WidgetHelper.buildStartText(),
                SizedBox(height: 15),
                Text(
                  'भक्तीत अंतर तुझ्या कधीहि नसावे l \nमागे पुढे आमुचिया विठू तू असावे ll',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Mukta_medium',
                    fontWeight: FontWeight.w600,
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHelper.buildHeader('दर्शन'),
                WidgetHelper.buildCard(
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13),
                          bottomLeft: Radius.circular(13),
                          bottomRight: Radius.circular(13),
                        ),
                        child: Image.asset(
                          width: double.infinity,
                          'assets/image/darshan.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Color(ColorCode.black).withValues(alpha: 0.9),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        child: Text(
                          'll समर्थ गणूदास हे मजवरी कृपाळू असो ll',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w600,
                            color: Color(ColorCode.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHelper.buildHeader('वरदवाणी'),
                WidgetHelper.buildCard(
                  WidgetHelper.buildRichText(
                    'को',
                    'णतेहि तत्त्व केवळ शब्दाच्या बळावर कधीहि जाणले जात नाहीं. तें अनुभवासच यावें लागतें. तेंच ब्रह्माच्या संबंधांतहि होतें. एक जुने वचन आहे “कसें बोटाने दाखवू तुला, घे अनुभव गुरुच्या मुला।” बोटाने दाखवितां येण्यासारखी, ही अमुक अमुक म्हणून वर्णन करून सांगण्यासारखी, ब्रह्म ही वस्तु नाहीं. ती अनुभवास येऊ शकते. गाढ झोपेसारखे हें आहे. म्हणून तर शास्त्रकारांनीं निद्रेला ब्रह्मानंदसहोदर असें विशेषण दिलें आहे.',
                    TextStyle(
                      fontSize: 24,
                      fontFamily: 'Mukta_medium',
                      color: Color(ColorCode.orange),
                      height: 1.5,
                    ),
                    TextStyle(
                      fontSize: 16,
                      fontFamily: 'Mukta',
                      color: Color(ColorCode.black),
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHelper.buildHeader('प्रतिष्ठान उद्दिष्टे'),
                WidgetHelper.buildCard(
                  Column(
                    children: [
                      WidgetHelper.buildRichText(
                        'स',
                        'त्कर्माची प्रेरणा देणारे, अकर्म टाळण्याची सूचना देणारे, सत्याचा निर्देश करणारे, सन्मार्ग दाखविणारे, उत्तम शिक्षण देणारे व सुबोध करणारे - असे सहा जन मनुष्यासाठी गुरु समान असतात, अशा अर्थाचे एक शास्त्र वचन आहे.',
                        TextStyle(
                          fontSize: 24,
                          fontFamily: 'Mukta_medium',
                          color: Color(ColorCode.orange),
                          height: 1.5,
                        ),
                        TextStyle(
                          fontSize: 16,
                          fontFamily: 'Mukta',
                          color: Color(ColorCode.black),
                          height: 1.7,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: WidgetHelper.buildButtonWithoutText(
                          context,
                          SvgPicture.asset(
                            'assets/svg/arrow.svg',
                            colorFilter: ColorFilter.mode(
                              Color(ColorCode.white),
                              BlendMode.srcIn,
                            ),
                          ),
                          AppRoutes.objectivesScreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetHelper.buildHeader('संपर्क'),
                WidgetHelper.buildCard(
                  Column(
                    spacing: 5,
                    children: [
                      Text(
                        'श्री दासगणू महाराज प्रतिष्ठान, गोरटे, ता. उमरी, जि. नांदेड, महाराष्ट्र - ४३१ ८०७.',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Mukta',
                          color: Color(ColorCode.black),
                        ),
                      ),
                      // _buildContactRow(
                      //   'श्री दासगणू महाराज प्रतिष्ठान, गोरटे, ता. उमरी, जि. नांदेड, महाराष्ट्र - ४३१ ८०७.',
                      //   ColorCode.black,
                      //   'assets/svg/pratishthan.svg',
                      // ),
                      _buildContactRow(
                        'santkavidasganu@gmail.com',
                        ColorCode.orange,
                        'assets/svg/email.svg',
                      ),
                      _buildContactRow(
                        '+९१ ९४२१९०१०९८, ०२४६७-२०२५१४',
                        ColorCode.orange,
                        'assets/svg/phone.svg',
                      ),
                      _buildContactRow(
                        'www.santkavidasganu.org',
                        ColorCode.orange,
                        'assets/svg/earth.svg',
                      ),
                      _buildContactRow(
                        'www.radhadamodar.org',
                        ColorCode.orange,
                        'assets/svg/earth.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(String text, int textColor, String assetName) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(assetName, height: 20),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mukta',
              color: Color(textColor),
            ),
          ),
        ),
      ],
    );
  }
}
