import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
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
          spacing: 25,
          children: [
            Column(
              children: [
                WidgetHelper.buildRichText(
                  'भक्तीत अंतर तुझ्या कधीही नसावे ',
                  '|',
                  TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mukta_medium',
                    color: Color(ColorCode.black),
                  ),
                  TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mukta_medium',
                    color: Color(ColorCode.orange),
                  ),
                ),
                WidgetHelper.buildRichText(
                  'मागेपुढे आमुचिया विठू तू असावे ',
                  '||',
                  TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mukta_medium',
                    color: Color(ColorCode.black),
                  ),
                  TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mukta_medium',
                    color: Color(ColorCode.orange),
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
                          'assets/image/appa.jpg',
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
                                  Color(ColorCode.black).withValues(alpha: 0.7),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        child: Text(
                          'पू . स्वामी वरदानंद भारती',
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
                          SvgPicture.asset(
                            'assets/svg/arrow.svg',
                            colorFilter: ColorFilter.mode(
                              Color(ColorCode.white),
                              BlendMode.srcIn,
                            ),
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
                WidgetHelper.buildHeader('संपर्क'),
                WidgetHelper.buildCard(
                  Column(
                    spacing: 5,
                    children: [
                      _buildContactRow(
                        'श्री दासगणू महाराज प्रतिष्ठान, गोरटे, ता. उमरी, जि. नांदेड, महाराष्ट्र - ४३१ ८०७.',
                        ColorCode.black,
                      ),
                      _buildContactRow(
                        'santkavidasganu@gmail.com',
                        ColorCode.orange,
                      ),
                      _buildContactRow(
                        '+९१ ९४२१९०१०९८, ०२४६७-२०२५१४',
                        ColorCode.orange,
                      ),
                      _buildContactRow(
                        'www.santkavidasganu.org',
                        ColorCode.orange,
                      ),
                      _buildContactRow(
                        'www.radhadamodar.org',
                        ColorCode.orange,
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

  Widget _buildContactRow(String text, int textColor) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Icon(Icons.location_city),
        Text(
          '•',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Mukta',
            color: Color(textColor),
            //height: 1.7,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mukta',
              color: Color(textColor),
              //height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}
