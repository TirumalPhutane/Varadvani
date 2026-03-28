import 'package:flutter/material.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class ObjectivesScreen extends StatelessWidget {
  const ObjectivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'प्रतिष्ठान उद्दिष्टे'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 10,
            bottom: 15,
          ),
          child: SafeArea(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WidgetHelper.buildStartText(),
                Text(
                  'निर्मोह: संयमी योगी शान्तो दान्तो विमत्सर: l\nसोsस्तु मे वरदो नित्यं वरदानंद भारती ll\nसुप्रसन्न: समाधानी निश्चयी च दृढव्रती l\nसोsस्तु मे वरदो नित्यं वरदानंद भारती ll',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mukta_medium',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                    color: Color(ColorCode.orange),
                  ),
                ),
                WidgetHelper.buildCard(
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13),
                    ),
                    child: Image.asset('assets/image/appa2.jpeg'),
                  ),
                ),
                Column(
                  spacing: 30,
                  children: [
                    _buildShlokaWithMeaning(
                      primaryText: 'सज्जन हो, सप्रेम जयहरि.',
                      shloka:
                          'प्रेरकः सूचकश्वैव वाचको दर्शकस्तथा । \nशिक्षको बोधकश्चैव षडेते गुरवः स्मृताः ॥',
                      explanation:
                          'सत्कर्माची प्रेरणा देणारे, अकर्म टाळण्याची सूचना देणारे, सत्याचा निर्देश करणारे, सन्मार्ग दाखविणारे, उत्तम शिक्षण देणारे व सुबोध करणारे – असे सहा जण मनुष्यासाठी गुरु समान असतात, अशा अर्थाचे एक शास्त्रवचन आहे. यातील एका गुणाने संपन्न असलेला गुरु लाभला तरी मनुष्याचे कल्याण होणे निश्चित आहे.',
                    ),
                    _buildShlokaWithMeaning(
                      primaryText: 'नारदभक्तिसूत्र सांगते –',
                      shloka:
                          'मुख्यतस्तु महत्कृपयैवभगवत्कृपालेशाद्वा ॥ महत्सङ्गस्त् दुर्लभोऽगम्योऽमोघश्च । लभ्यतेऽपि तत्कृपयैव ॥',
                      explanation:
                          'प्रेमभक्तीच्या प्राप्तीचे साधन मुख्यत: महापुरुषांच्या कृपेने अथवा भगवंताच्या लवमात्र कृपेने सद्भक्ताला प्राप्त होते. तथापि महापुरुषांचा सङ्ग दुर्लभ, अगम्य आणि अमोघ आहे. भगवंताच्या कृपेनेच महापुरुषांचा संश्रय प्राप्त होतो.',
                    ),
                    _buildShlokaWithMeaning(
                      primaryText: 'विवेकचूडामणि यात नमूद केले आहे –',
                      shloka:
                          'दुर्लभं त्रयमेवैतद्देवानुग्रहहेतुकम् । \nमनुष्यत्वं मुमुक्षुत्वं महापुरुषसंश्रयः ॥',
                      explanation:
                          'ज्यामुळे भगवत्कृपा प्राप्त होते, तो मनुष्यजन्म, मुमुक्षुत्व (मुक्त होण्याची इच्छा) व महापुरूषाचा आश्रय या तिन्हीही गोष्टी अत्यंत दुर्लभ आहेत.',
                    ),
                    _buildShlokaWithMeaning(
                      primaryText: 'आद्य शंकराचार्य म्हणतात –',
                      shloka:
                          'सत्संगत्वे निःसंगत्वम् निःसंगत्वे निर्मोहत्वम् । \nनिर्मोहत्वे निश्चलत्वम् निश्चलत्वे जीवनमुक्तिः ॥',
                      explanation:
                          'मनुष्याला सत्संग मिळाला असता निःसंगत्व प्राप्त होते आणि निःसंगत्वामुळे निर्मोहत्व प्राप्त होते. मनुष्य निर्मम झाला असता त्याला निश्चलत्व प्राप्त होते, तो दृढनिश्चयी बनतो आणि असे निश्चलत्व त्याला जीवनमुक्ती मिळवून देते.',
                    ),
                    Text(
                      '|| ॐ शांति: शांति: शांति: ||',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCode.orange),
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShlokaWithMeaning({
    required String primaryText,
    required String shloka,
    required String explanation,
  }) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            primaryText,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Mukta',
              letterSpacing: 0,
              color: Color(ColorCode.black),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            shloka,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.bold,
              color: Color(ColorCode.black),
            ),
          ),
        ),
        WidgetHelper.buildRichText(
          'अर्थात, ',
          explanation,
          TextStyle(
            fontSize: 18,
            fontFamily: 'Mukta',
            color: Color(ColorCode.black),
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            height: 1.5,
          ),
          TextStyle(
            fontSize: 18,
            fontFamily: 'Mukta',
            color: Color(ColorCode.black),
            letterSpacing: 0,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
