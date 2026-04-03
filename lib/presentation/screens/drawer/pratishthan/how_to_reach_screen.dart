import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class HowToReachScreen extends StatelessWidget {
  const HowToReachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.how_to_reach),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 10,
              bottom: 15,
            ),
            child: Column(
              spacing: 20,
              children: [
                WidgetHelper.buildStartText(),
                _buildMainText(
                  'गोरटे',
                  'अक्षांश - १९.०५४३९७ / रेखांश - ७७.६२४८५५\nभूतल स्थान निर्देशांक (GPS Coordinates) १९° ३’ १५.८२९२” उत्तर / ७७° ३७’ २९.४७८” पूर्व',
                ),
                _buildMainText(
                  'उमरी',
                  'अक्षांश - १९.०४२१६६ / रेखांश - ७७.६४३५५६\nभूतल स्थान निर्देशांक (GPS Coordinates) १९° २’ ३१.७९७६” उत्तर / ७७° ३८’ ३६.८०१६” पूर्व',
                ),
                _buildMainText(
                  'नांदेड',
                  'अक्षांश - १९.१५९५०० / रेखांश - ७७.३१०९००\nभूतल स्थान निर्देशांक (GPS Coordinates) १९° ९’ ३४.२” उत्तर / ७७° १८’ ३९.२४” पूर्व',
                ),
                WidgetHelper.buildNormalText(
                  'मराठवाड्यातील लहानसे गोरटे हे गाव पू. श्रीदासगणू महाराज व पू. स्वामी वरदानंद भारती यांच्या पुनित वास्तव्याने तीर्थक्षेत्र बनले आहे. बऱ्याच समाज हितैषींचे, राष्ट्रोद्धारक चिंतकांचे, धर्मनिष्ठ धुरीणांचे, सत्पुरुषांचे, महात्म्यांचे, अधिकारी महापुरुषांचे पाय या संतद्वयांच्या दर्शन-भेटीच्या ओढीने गोरटे गावाला लागले आहेत.',
                ),
                WidgetHelper.buildNormalText(
                  'पू. दादा व पू. अप्पा यांच्यासारखे संतसत्पुरुष जेव्हा एखाद्या ठिकाणी वास्तव्य करतात, उपासना करतात तेव्हा त्या ठिकाणी वास करणारी सुप्त शक्ती जागृत होते. ती शक्ती जागी करण्यास लागणारी अंत:करणाची पवित्रता आणि भावनेची परम उत्कटता हे दोन्ही गुण त्या त्या संतांच्या अंगी सहजरित्या वास करीत असल्याने अशा संतांच्या तपश्चर्येच्या अधिष्ठानामुळे व तेथील अनेक वर्षे अखंड चालवलेल्या उपासनेने त्या ठिकाणी एक अतींद्रिय तेज, जीवाकर्षक ओढ, मनाचा ठाव घेणारी शांतता निरंतर प्रगटू लागते. याचा प्रत्यय त्या पावन ठिकाणी भेट देणाऱ्या प्रत्येकाला अगदी सहज अनुभवायला येतो. हा मिळालेला पवित्र अनुभव पुनःपुन्हा का नाही घ्यावा वाटणार? ही पावन अनुभूती करून घ्यायला गोरट्याला येण्यासाठी दळणवळणाची सर्व साधने उपलबध आहेत.',
                ),
                WidgetHelper.buildNormalText(
                  'गोरटे हे गाव नांदेडच्या पूर्वेला असून नांदेड ते गोरटे हे अंतर ४५ किमी आहे. नांदेडहून खाजगी वाहनाने मुदखेड अथवा भोकर मार्गे यावे लागते. गोरटे हे गाव उमरी या तालुक्याच्या ठिकाणापासून ०३ किमी अंतरावर आहे. उमरी हे रेल्वेस्टेशन दक्षिण-मध्य रेल्वेच्या नांदेड - निझामाबाद या मार्गावर आहे. मुंबई, मनमाड, काचीगुडा, सिकंदराबाद या दरम्यानच्या सर्व प्रवासी व काही जलद रेल्वे गाड्यांना उमरी स्थानकाचा थांबा आहे. उमरी स्थानकापासून गोरट्याला येण्यासाठी ऑटोरिक्षा उपलब्ध असतात.',
                ),
                Text(
                  'साधनेसाठी गोरट्याला येणाऱ्या साधकांसाठी नि:शुल्क भोजन आणि निवासव्यवस्था केली जाते. प्रतिष्ठानच्या संपर्क क्रमांकावर (०२४६७-२०२५१४) पूर्वसूचना दिल्यास भाविकांची गैरसोय होणार नाही. तथापि अनोळखी व्यक्तींना रात्रीच्या मुक्कामाची अनुमती नसते. नवीन व अपरिचित व्यक्तीस मुक्कामासाठी यायचे असल्यास श्रीदासगणू परिवारातील अनुग्रहित सदस्यांच्या ओळखीच्या शिफारशीने अनुमती देण्याबाबत विचार होऊ शकतो. मात्र अशा नवीन व अपरिचित व्यक्तीच्या गोरट्यास भेट देण्याचा उद्देश केवळ कुतूहल/उत्सुकता हा नसावा; साधना-उपासना करणे हा उद्देश असणे अनिवार्य आहे. तसेच येथील दिनक्रमाचे व शिस्तीचे पालन करून शांतता व पावित्र्य सांभाळावेच लागेल.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainText(String title, String text) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
            color: Color(ColorCode.black),
            letterSpacing: 0,
            height: 1.5,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
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
