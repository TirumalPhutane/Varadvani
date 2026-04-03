import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class AboutPratishthanScreen extends StatelessWidget {
  const AboutPratishthanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.about_foundation,
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
                WidgetHelper.buildNormalText(
                  'आधुनिक महिपती संतकवी श्रीदासगणू महाराज एक रसाळ, भक्तिरसप्रधान कीर्तनकार म्हणून महाराष्ट्रात प्रसिद्ध आहेत. १८६८ ते १९६२ एवढा प्रदीर्घ जीवनकाळ त्यांना लाभला. दीड लाखांपेक्षा अधिक त्यांची वाङ्मयसंपदा असून ती “संतकवी श्री दासगणूमहाराज समग्र वाङ्मय ” म्हणून प्रसिद्ध आहे. हे त्यांचे वाङ्मय भक्तिरसाने समृद्ध आहेच पण त्यात त्यांची समाजमनस्कता विशेष प्रत्ययाला येते. समाजाचे नैतिक मनोधैर्य संतांनी सांभाळले, तेच कार्य दासगणू महाराजांनी केले. सदाचार, सन्नीती आणि सद्वासना यांच्या जोपासनेवर त्यांचा भर होता. कीर्तन हे माध्यम वापरुन त्यांनी केवळ महाराष्ट्रच गाजविला नाही तर मराठी माणसे असणाऱ्या बडोदा, इंदूर, उज्जैन, चेन्नई इ. अनेक स्थानी त्यांनी कीर्तनाद्वारे प्रचार करुन लोकजागृती केली. सामाजिक भान हा गुणविशेष जसा त्यांच्या वाङ्मयात दिसतो तसेच वाङ्मयीन सौंदर्य व अन्य गुणही त्यांच्या वाङ्मयात ठळकपणे दिसतात. त्यांची आख्यान संविधानके अप्रतिम आहेत. ते रसपरीपोष उत्तम साकारतात आणि उपमा, उत्प्रेक्षादी अलंकारही त्यांच्या भाषेत समृध्दपणे सापडतात. सद्गुरू श्रीसाईबाबा यांच्या आज्ञेने ते नांदेडकडे आले. त्यांच्या भक्तीपरिप्लुत आख्यानांनी त्यांनी समाज आकृष्ट केला.',
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
                      'assets/image/samadhi_mandir.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                WidgetHelper.buildNormalText(
                  'गोरटे (उमरी) गावाला मातृस्थानी वंदनीय असलेल्या आदरणीय आनंदीबाई गोपाळराव देशमुख यांनी महाराजांना १९३८-३९ मध्ये गोरटयात आणले. गोरटे या छोट्याश्या गावातील प्रसन्न परिसर, तेथील शांत वातावरण महाराजांना विशेष आवडले. ते पुढे प्रतिवर्षी येथे येत राहिले. विश्रांतीसाठी महाराज या गावात दीर्घकाळ वास्तव्य करीत असत. भक्तगणांच्या वाढत्या प्रेमाप्रीत्यर्थ आणि आ. आनंदीबाईंच्या औदार्याने गोरट्याची ही जागा श्रीदासगणू महाराजांचे निवासस्थानच बनले. श्रीदासगणू महाराजांची समृध्द परंपरा त्यांचे पुत्र निर्विशेष शिष्य प्राचार्य अनंत दामोदर आठवले (पू. अप्पा) यांनी चालविली. तेच स्वामी वरदानंद भारती!',
                ),
                WidgetHelper.buildNormalText(
                  'श्री दासगणू महाराजांचा लोकसंग्रह मोठा होता. तोच वारसा पुढे सक्षमपणे नेत महाराजांनी सांगितल्याप्रमाणे प्रा. आठवले यांनी उपासना दृढपणे चालविली. स्वत:ही उत्तम प्रकारची वाङ्मय निर्मिती केली. ब्रह्मसूत्रे, उपनिषदे व गीता यावर त्यांनी विवरणात्मक लेखन केलेच पण संस्कृतीवर घेतल्या जाणाऱ्या चुकीच्या आक्षेप व आरोपांचा त्यांनी आपल्या अचूक, सडेतोड तर्क, साधार पुरावे व अमोघ वक्तृत्वाने प्रखर समाचार घेतला. त्यांच्या भक्तिपरिप्लुत कीर्तनांनी आणि आक्षेपकांच्या मुखभंजनाने त्यांनी संत व संतांच्या वाङ्मयाकडे पाहण्याची नवी दृष्टी दिली. संतकवी दासगणू महाराजांचे समग्र वाङ्मय प्रसिध्द केले. ही त्यांची मराठी भाषेला मोठी देणगीच आहे. सामान्य माणसालाही जीवनविषयक एक नवीन दृष्टी त्यांच्या वाङ्मयातून मिळते. संतांचे उत्तरदायित्व श्रीदासगणूंनी यथासांगपणे सांभाळले तर प्रा. आठवले यांनी ते वृद्धिंगत केले.',
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
                      'assets/image/samadhi.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                WidgetHelper.buildNormalText(
                  'आपल्या सदगुरुंच्या परिवारातील अनेक ज्येष्ठ भक्तांच्या आग्रहामुळे व श्रीदासगणू महाराजांचे नित्यस्मरण हीच पुढील कार्याची उर्जा व प्रेरणा आहे हे लक्षात घेवून पू. अप्पांनी श्रीक्षेत्र गोरटे येथे सद्गुरु दासगणू महाराजांचे वस्त्रसमाधी मंदिर निर्माण केले. “श्रीदासगणू महाराज प्रतिष्ठान” या नावाने १९७४ मध्ये रीतसर पंजीकृत करुन विश्वस्त मंडळाची निर्मिती केली आणि हे प्रतिष्ठान कार्यान्वित झाले. पहिल्यापासून त्यांचा विशेष आग्रह असा होता की, हे स्थान पर्यटनकेंद्र न होता, साधनाकेंद्र व्हावे. संसारतप्त जीवांना स्वतःचे हृदय निवविण्यासाठी एक शांतीकेंद्र, तरुण वर्गाला जीवनात राष्ट्रीय हिताच्या विचारांनी प्रेरित अशा योग्य मार्गाचे दिग्दर्शन करणारे एक शक्तीकेंद्र, साधकांना त्यांच्या साधनमार्गात सुयोग्य व निश्चित वाटचालीसाठी आश्वासक पाठबळ देणारे एक उत्तम साधनाकेंद्र म्हणून आज हे ठिकाण महाराष्ट्रात नावारूपाला आले आहे.',
                ),
                WidgetHelper.buildNormalText(
                  'पू. अप्पांनी गोरटे प्रतिष्ठानचे सर्व व्यवस्थापन उत्तमप्रकारे करुन दिले होते. मुळातच संन्यस्त वृत्तीने वागलेल्या पू. अप्पांनी या सर्वांतून अलिप्तपणे बाजूला होत आपल्या सद्गुरुंच्या इच्छापूर्तीसाठी १९९१ मध्ये कैलासाश्रम, उत्तरकाशी, येथे प्रत्यक्षात संन्यास दीक्षा ग्रहण केली व चतुर्थाश्रमी स्वामी वरदानंद भारती हे नामाभिधान धारण केले.',
                ),
                WidgetHelper.buildNormalText(
                  'प्रतिष्ठानमध्ये देणगी स्वीकारली जाते व दिलेल्या देणगीची रीतसर पावती केली जाते. वस्तुरूपानेही देणगी स्वीकारली जाते परंतु देणगीदाराचा कोणत्याही प्रकारचा नामोल्लेख प्रकटपणे केला जात नाही. अशा प्रकारच्या देणगीस प्रदर्शनीय रूप येऊ नये व तशी देणगी निरहंकारी वृत्तीने दिलेली असावी, हाच केवळ यामागचा उद्देश!',
                ),
                WidgetHelper.buildNormalText(
                  'श्री दासगणू प्रतिष्ठानच्या वतीने प्रतिष्ठानच्या आवारात भागवत औषधालय मोफत चालविले जाते. भव्य कीर्तनमंडप असून मंदिराच्या मागे मानसविहार असून तेथे साधकांच्या निवासाची सोय केली जाते. श्रीविठ्ठलरुक्मिणीचे व श्रीशनिदेवाचे अशी दोन छोटी मंदिरे आवारातच आहेत.',
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
                      'assets/image/shani_mandir.jpg',
                      fit: BoxFit.fitWidth,
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
                      'assets/image/vitthal_mandir.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                WidgetHelper.buildNormalText(
                  'प्रतिष्ठानचे व्यवस्थापनाच्या कार्यानुसार खालीलप्रमाणे विभाग कार्यरत आहेत.',
                ),
                Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildVibhag(
                      '१. नित्योपचार विभाग',
                      ' - श्रींच्या समाधीची पूजाअर्चा, अभिषेकादी व्यवस्था.',
                    ),
                    _buildVibhag(
                      '२. अन्नछत्र विभाग',
                      ' - साधनेसाठी येणाऱ्या साधकांची व्यवस्था.',
                    ),
                    _buildVibhag(
                      '३. उत्सव विभाग',
                      ' - प्रतिष्ठानकडून प्रमुख संतांच्या पुण्यतिथी उत्सवाची व्यवस्था.',
                    ),
                    _buildVibhag(
                      '४. आरोग्य विभाग',
                      ' - औषधनिर्मिती, रोगचिकित्सा व मोफत उपचारव्यवस्था.',
                    ),
                    _buildVibhag(
                      '५. वास्तू विभाग',
                      ' - वास्तू निर्मितीचे संकल्पपूर्ती व्यवस्था.',
                    ),
                    _buildVibhag(
                      '६. वाङ्‌मय विभाग',
                      ' - संतकवी दासगणू महाराज व स्वामी वरदानंद भारती यांच्या वाङ्‌मय प्रसिद्धीची व्यवस्था.',
                    ),
                    _buildVibhag(
                      '७. गोशाळा विभाग',
                      ' - भारतीय वाणाच्या गायींची व गोवंशाची संपूर्ण व्यवस्था.',
                    ),
                  ],
                ),
                _buildLastParagraph(),
                WidgetHelper.buildCard(
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13),
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13),
                    ),
                    child: Image.asset(
                      width: double.infinity,
                      'assets/image/samadhi_and_appa.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(
                  'll समर्थ गणुदास ते सतत मी नमस्कारितो ll',
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
          ),
        ),
      ),
    );
  }

  Widget _buildVibhag(String title, String description) {
    return WidgetHelper.buildRichText(
      title,
      description,
      TextStyle(
        fontSize: 18,
        fontFamily: 'Mukta',
        fontWeight: FontWeight.bold,
        color: Color(ColorCode.black),
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
    );
  }

  Widget _buildLastParagraph() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Color(ColorCode.black),
          fontSize: 18,
          fontFamily: 'Mukta',
          letterSpacing: 0,
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: '“श्रीराधादामोदार प्रतिष्ठान” ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                ' हे प्रतिष्ठान पंजीकृत असून श्री. दासगणू महाराज व प्रा. आठवले (स्वामी वरदानंद भारती) यांच्या वाङ्‌मयाचे प्रकाशन करणे, हा या प्रतिष्ठानाचा प्रधान हेतू आहे. श्रीदासगणू महाराजांच्या स्मृतीप्रीत्यर्थ त्यांच्या पुण्यतिथीच्या दिवशी पंढरपूर येथे दिल्या जाणाऱ्या',
          ),
          TextSpan(
            text: ' “श्रीदासगणू” ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'पुरस्कारासाठी धर्मकार्य, देशकार्य व संस्कृतीच्या संवर्धनासाठी उत्तम कार्य करणाऱ्या व्यक्ती अथवा संस्था यांची निवड करून त्या पुरस्काराचे प्रदान करण्याच्या कार्यक्रमाचे आयोजन हे प्रतिष्ठान करते. या प्रतिष्ठान अंतर्गत',
          ),
          TextSpan(
            text: ' “संतविद्या प्रबोधिनी” ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'ही शाखा संत व सांस्कृतिक कार्यासाठी निर्माण केली. या दोन्ही संस्था वरील प्रतिष्ठानच्या भगिनी संस्था आहेत.',
          ),
        ],
      ),
    );
  }
}
