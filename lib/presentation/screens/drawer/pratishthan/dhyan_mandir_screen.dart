import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class DhyanMandirScreen extends StatelessWidget {
  const DhyanMandirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.meditation_hall,
      ),
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
                _buildText(
                  'समाधी मंदिराच्या वर ध्यानमंदिर स्थापिले आहे. गोरट्यातील आध्यात्मिक दिवसाची सुरुवात ध्यानमंदिरातील प्रार्थनेने होते. श्रीसंत तुकाराम महाराज यांचे दोन अभंग व समर्थ रामदास स्वामींचे करुणाष्टके प्रारंभी म्हणली जातात. त्या नंतर १० मिनिटे डोळे मिटून मौनयुक्त ध्यान केले जाते. विधिवत मंत्रजागर करून स्वतः पू. अप्पांनी श्रीवरदनारायणाच्या प्रतिमेची प्रतिष्ठापना या ध्यानमंदिरात केली आहे.',
                ),
                _buildText(
                  'सद्गुरू श्रीदासगणू महाराजांच्या मार्गदर्शनाखाली पू. अप्पांची साधना योग्य दिशेने वाटचाल करीत होती. साधनामार्गातील विविध मूर्त संकेतांमुळे त्यास पुष्टी मिळत होती. तथापि त्यामुळे त्यांची भगवंताच्या साकार दर्शनाची क्षुधा वाढतच होती. पू. अप्पांना आता श्रीनारायणाच्या रोकड्या प्रचितीची ओढ लागली होती. जेव्हा त्यांची ती ओढ तीव्रतम व असह्य झाली तेव्हा पू. अप्पा स्वतःच्या जीवावर उदार होवून एका निर्धारानेच गंगोत्री येथे अनुष्ठानास बसले. अशा वेळी त्या करुणानिधी प्रभोला पाझर न फुटता तरच नवल! श्रावण वद्य एकादशी, शके १८९३, सोमवार, दि.१६/०८/१९७१ या दिवशी पहाटे ब्रह्ममुहूर्ताच्या वेळी श्रीवरदनारायणाने पू. अप्पांना साकार स्वरूपात दर्शन दिले.',
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
                      'assets/image/varadnarayan.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(
                  'साकारले रूप असुनी निर्गुणि l \nअर्ध पद्मासनी शोभे मूर्ती ll \nशंख चक्र धरी गदा अंकावरी l \nकृपेने उभारी वरद करा ll',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
                _buildText(
                  'त्या साकार रूपाचीच प्रतिमा या ध्यानमंदिरात स्थापिली आहे. पू. अप्पांनी दिलेल्या सूचनांप्रमाणे सांगलीचे सिद्धहस्त व प्रतिभावान चित्रकार कै. कल्याण शेटे यांनी ती प्रतिमा अतिशय सुंदररित्या साकारली आहे. श्रीवरदनारायणाची ही स्मितहास्ययुक्त, प्रसन्न, धीरगंभीर, मनमोहक, विलोभनीय, चित्ताकर्षक व नितांत सुंदर प्रतिमा उपलब्ध होणे, ही आपणा सर्वांसाठी परम भाग्याचीच गोष्ट!',
                ),
                _buildText(
                  'ध्यानमंदिरातील ध्यानाच्या वेळी प्रत्येक साधक त्या प्रतिमेशी एकरूप होवून श्रीवरदनारायणाशी आपले अनुसंधान साधत असतो. त्यामुळेच ध्यानमंदिरातील डोळे मिटून मौनयुक्त ध्यानाचा कालावधी १० मिनिटे इतका थोडासा असला तरी त्याचा परिणाम खोलवर व प्रदीर्घ आणि साधकाला आश्वासक असतो. याची प्रत्यक्ष अनुभूती घ्यायलाच हवी असे हे स्थान आहे. येथील प्रसन्नता, शांतता, पावित्र्य, शुचिता यांचा अनुभव येथे येणाऱ्या प्रत्येकाला हामखास येतो.',
                ),
                Text(
                  'काही महत्वाच्या सूचना',
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
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText('१. ध्यानमंदिरात स्नान करून मगच जावे.'),
                      _buildText(
                        '२. ध्यानमंदिरात स्वतःचे आसनावर ध्यानार्थ बसावे.',
                      ),
                      _buildText(
                        '३. कोणत्याही संप्रदायाच्या व्यक्तीला येथे बसता येईल.',
                      ),
                      _buildText(
                        '४. नामजप व धार्मिक ग्रंथाचे पारायण करता येईल.',
                      ),
                      _buildText('५. ध्यानमंदिरात कटाक्षाने पूर्ण मौन पाळावे.'),
                      _buildText(
                        '६. चिंतनासाठी किमान १० मिनिटे वेळ दिलाच पाहिजे.',
                      ),
                      _buildText(
                        '७. आठ वर्षाखालील लहान मुलांना ध्यानमंदिरात आणू नये.',
                      ),
                      _buildText(
                        '८. ज्यांना शांतता पाळणे शक्य नाही अशा आठ वर्ष वयाच्या पुढील मुलांनाही येथे आणू नये.',
                      ),
                      _buildText(
                        '९. एकाग्रतेच्या साधनेसाठी प्रतिदिन सकाळी ७ वाजता सामुदायिक अभ्यास केला जाईल.',
                      ),
                      _buildText(
                        '१०. श्रीवरदनारायणाच्या प्रतिमेला हळद-कुंकू, बुक्का इ. काहीही वाहू नये.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Mukta',
        color: Color(ColorCode.black),
        letterSpacing: 0,
        height: 1.5,
      ),
    );
  }
}
