import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class ShreeDasganuAwardScreen extends StatelessWidget {
  const ShreeDasganuAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'श्रीदासगणू पुरस्कार'),
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
                  'हिंदू राष्ट्र, हिंदू संस्कृति, वेद व आयुर्वेद हे पू. अप्पांच्या अत्यंत जिव्हाळ्याचे विषय होते. धर्मकार्य, देशकार्य व संस्कृतीच्या संवर्धनासाठी उत्तम कार्य करणाऱ्या व्यक्ती अथवा संस्था यांना पाठबळ देण्यासाठी, त्यांनी घेतलेल्या निस्पृह कष्टाची, केलेल्या नि:स्वार्थ त्यागाची दखल घ्यावी व त्यांचे महनीय कार्य समाजापुढे यावे, या हेतूने श्रीदासगणू महाराजांच्या स्मृतिप्रीत्यर्थ “श्रीदासगणू पुरस्कार” प्रदान करण्याची योजना त्यांनी स्वतःच्या हयातीतच इ. स. १९९८ या वर्षी कार्यान्वित केली होती. श्रीदासगणू महाराजांच्या पुण्यतिथीच्या दिवशी म्हणजे कार्तिक वद्य त्रयोदशीला श्रीदासगणू महाराजांनी पंढरपूरच्या ज्या वाड्यात आपला देह श्री पांडुरंगाच्या चरणी अर्पण केला, त्या त्यांच्या “दामोदराश्रम” येथेच हा पुरस्कार प्रदानाचा कार्यक्रम प्रतिवर्षी होत असतो.',
                ),
                WidgetHelper.buildNormalText(
                  'रु.२५,०००/- पासून सुरू केलेला हा पुरस्कार सध्या रु. १,२५,०००/- इतक्या रक्कमेपर्यंत वाढवीत नेला आहे. स्मृतिचिन्ह, शाल, श्रीफल व रोख रक्कम असे या पुरस्काराचे स्वरूप आहे.',
                ),
                WidgetHelper.tableHeader(
                  TableData('अ. क्र.', 'वर्ष', 'पुरस्काराचे मानकरी'),
                  0.5,
                  0.7,
                  1.5,
                ),
                ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final member = data[index];
                    return WidgetHelper.buildTable(member, 0.4, 0.6, 1.4);
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: DottedLine(
                      dashLength: 4,
                      dashColor: Color(
                        ColorCode.darkGray,
                      ).withValues(alpha: 0.15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<TableData> data = [
  TableData('१.', '१९९८', 'प्रज्ञालोक (त्रैमासिक), नागपूर.'),
  TableData('२.', '१९९९', 'धर्मभास्कर (मासिक), मुंबई.'),
  TableData('३.', '२०००', 'पाञ्चजन्य (साप्ताहिक), दिल्ली.'),
  TableData(
    '४.',
    '२००१',
    'जनजाती विकास समिती, डीमापूर - नागालैंड\nश्री. सुनील चिंचोलकर, पुणे.',
  ),
  TableData(
    '५.',
    '२००२',
    'डॉ. मु. श्री. कानडे, पुणे\nडॉ. ज. द. जोगळेकर, मुंबई.',
  ),
  TableData('६.', '२००३', 'मसुराश्रम, गोरेगाव, मुंबई.'),
  TableData('७.', '२००४', 'डॉ. ग. बा. पळसुले, पुणे.'),
  TableData('८.', '२००५', 'श्री शिवप्रतिष्ठान–हिंदुस्तान, सांगली.'),
  TableData(
    '९.',
    '२००६',
    'श्री गुरुदेव आश्रम, वडाळा महादेव, ता. श्रीरामपूर, जि. अहिल्यानगर.',
  ),
  TableData('१०.', '२००७', 'श्री. विक्रम नारायण सावरकर, मुंबई.'),
  TableData('११.', '२००८', 'प्रा. श्रीनिवास माणिकराव कुलकर्णी, नागपूर.'),
  TableData('१२.', '२००९', 'श्री. द्वा. वा. केळकर, पुणे.'),
  TableData(
    '१३.',
    '२०१०',
    'श्री सच्चिदानंद वेद स्वाध्याय प्रतिष्ठान, ध. टाकळी, ता. पूर्णा, जि. परभणी.',
  ),
  TableData('१४.', '२०११', 'श्री एकनाथ संशोधन मंदीर, छ. संभाजीनगर.'),
  TableData('१५.', '२०१२', 'श्री समर्थ वाङ्देवता मंदिर, धुळे.'),
  TableData('१६.', '२०१३', 'सौ. सुनिला हरि सोवनी, पुणे.'),
  TableData('१७.', '२०१४', 'श्री हरि कीर्तनोत्तेजक सभा, पुणे.'),
  TableData('१८.', '२०१५', 'श्री. जगन्नाथ चव्हाण, तळेगाव दाभाडे, जि. पुणे.'),
  TableData(
    '१९.',
    '२०१६',
    'श्री. दिलीप वासुदेव आपटे, गीता फाउंडेशन, मिरज, जि. सांगली.',
  ),
  TableData(
    '२०.',
    '२०१७',
    'श्री चतुर्वेदेश्वर धाम, सावरगाव, ता. परतूर, जि. जालना.',
  ),
  TableData('२१.', '२०१८', 'सांस्कृतिक वार्तापत्र (पाक्षिक), पुणे.'),
  TableData('२२.', '२०१९', 'साप्ताहिक पंढरी संदेश, पंढरपूर.'),
  TableData('२३.', '२०२०', 'स्वा. सावरकर प्रेमी मंडळ, पंढरपूर.'),
  TableData('२४.', '२०२१', 'धर्म जागरण ट्रस्ट (पश्चिम महाराष्ट्र).'),
  TableData('२५.', '२०२२', 'वैदर्भीय हरिकीर्तन संस्था, नागपूर.'),
  TableData('२६.', '२०२३', 'डॉ. शरद पांडुरंग हेबाळकर, अंबाजोगाई, जि. बीड.'),
];
