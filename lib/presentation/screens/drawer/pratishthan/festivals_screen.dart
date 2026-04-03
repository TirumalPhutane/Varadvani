import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class FestivalsScreen extends StatelessWidget {
  const FestivalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.festivals),
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
                Text(
                  'श्रीक्षेत्र गोरटे येथे २०२५ या सालात संपन्न होणारे उत्सव - महोत्सव',
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
                WidgetHelper.tableHeader(
                  TableData('उत्सव', 'तिथी', 'दिनांक'),
                  1.4,
                  1.1,
                  1,
                ),
                ListView.separated(
                  itemCount: festivals.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final member = festivals[index];
                    return WidgetHelper.buildTable(member, 1.3, 1, 1);
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
                SizedBox(),
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
                      _buildText(
                        '१. सद्गुरू वामनशास्त्री पुण्यतिथी उत्सव पुणे येथे आणि श्रीज्ञानेश्वर महाराज व सद्गुरू दासगणू महाराज पुण्यतिथी उत्सव पंढरपूर येथे संपन्न होत असतो.',
                      ),
                      _buildText(
                        '२. उर्वरित सर्व उत्सव गोरटे येथेच संपन्न होत असतात.',
                      ),
                      _buildText(
                        '३. गोरटे येथील उत्सवासाठी येणाऱ्या भाविकांसाठी निवासव्यवस्था उपलब्ध आहे.',
                      ),
                      _buildText(
                        '४. प्रतिष्ठानच्या पूर्व परवानगीने व परिवारातील सदस्यांच्या विनंती नुसार काही उत्सव गोरटे व्यतिरिक्त इतर ठिकाणी आयोजित केले जाऊ शकतात.',
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

List<TableData> festivals = [
  TableData(
    'श्रीदासगणू महाराज जयंती उत्सव',
    'पौष शुद्ध दशमी ते द्वादशी',
    '०९ ते ११ जानेवारी २०२५',
  ),
  TableData(
    'श्रीरामदास नवमी',
    'माघ वद्य अष्टमी ते दशमी',
    '२१ ते २३ फेब्रुवारी २०२५',
  ),
  TableData('महाशिवरात्र', 'माघ वद्य त्रयोदशी', '२६ फेब्रुवारी २०२५'),
  TableData(
    'श्रीतुकाराम बीज व श्रीनाथषष्ठी',
    'फाल्गुन वद्य द्वितीया ते सप्तमी',
    '१६ ते २१ मार्च २०२५',
  ),
  TableData(
    'श्रीविठ्ठलरुक्मिणी मंदिर वर्धापन सोहळा',
    'फाल्गुन वद्य एकादशी',
    '२६ मार्च २०२५',
  ),
  TableData(
    'श्रीराम नवमी',
    'चैत्र शुद्ध अष्टमी ते दशमी',
    '०५ ते ०७ एप्रिल २०२५',
  ),
  TableData(
    'पू. अप्पांची संन्यास दीक्षाग्रहण तिथी',
    'चैत्र वद्य एकादशी',
    '२४ एप्रिल २०२५',
  ),
  TableData('श्रीपरशुराम जयंती', 'वैशाख शुद्ध तृतीया', '३० एप्रिल २०२५'),
  TableData('श्रीनृसिंह जयंती', 'वैशाख शुद्ध चतुर्दशी', '११ मे २०२५'),
  TableData(
    'गंगा दशहरा',
    'ज्येष्ठ शुद्ध प्रतिपदा ते दशमी',
    '२७ मे ते ०५ जून २०२५',
  ),
  TableData(
    'सद्गुरू वामनशास्त्री पुण्यतिथी उत्सव',
    'ज्येष्ठ वद्य दशमी ते द्वादशी',
    '२१ ते २३ जून २०२५',
  ),
  TableData('गुरुपौर्णिमा', 'आषाढ पौर्णिमा', '१० जुलै २०२५'),
  TableData(
    'गोकुळाष्टमी निमित्त श्रीकृष्णकथामृत या काव्य ग्रंथाचे पारायण',
    'श्रावण शुद्ध पंचमी ते श्रावण वद्य अष्टमी',
    '२९ जुलै ते १५ ऑगस्ट २०२५',
  ),
  TableData(
    'स्वामी वरदानंद भारती स्मरण महोत्सव',
    'श्रावण वद्य दशमी ते चतुर्दशी',
    '१८ ते २२ ऑगस्ट २०२५',
  ),
  TableData(
    'पू. अप्पांची जयंती (अनंत चतुर्दशी)',
    'भाद्रपद शुद्ध चतुर्दशी',
    '०६ सप्टेंबर २०२५',
  ),
  TableData(
    'श्रीज्ञानेश्वर महाराज व सद्गुरू दासगणू महाराज पुण्यतिथी उत्सव',
    'कार्तिक वद्य दशमी ते चतुर्दशी',
    '१४ ते १८ नोव्हेंबर २०२५',
  ),
];
