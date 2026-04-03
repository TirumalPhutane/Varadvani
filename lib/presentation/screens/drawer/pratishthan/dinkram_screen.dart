import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class DinkramScreen extends StatelessWidget {
  const DinkramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.daily_schedule),
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
                WidgetHelper.tableHeader(
                  TableData('अ. क्र.', 'वेळ', 'कार्यक्रम'),
                  0.5,
                  1.1,
                  1.5,
                ),
                ListView.separated(
                  itemCount: schedule.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final member = schedule[index];
                    return WidgetHelper.buildTable(member, 0.5, 0.9, 1.5);
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
                  'गोरटे येथे सर्व प्रार्थनेनंतर व प्रत्येक कार्यक्रमानंतर केला जाणारा जयघोष',
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
                  'll पुंडलीकवरदा हरि विठ्ठल ll\nll सद्गुरू ज्ञानेश्वर तुकाराम महाराज की जय ll\nll सद्गुरू दासगणू महाराज की जय ll\nll स्वामी वरदानंद महाराज की जय ll\nll जय जय रघुवीर समर्थ ll\nll नमः पार्वतीपतये हर हर महादेव ll\nll भारत माता की जय ll',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    color: Color(ColorCode.orange),
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  'महत्वाची सूचना',
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
                WidgetHelper.buildNormalText(
                  'साधनेसाठी गोरट्याला येणाऱ्या साधकांसाठी नि:शुल्क भोजन आणि निवासव्यवस्था केली जाते. प्रतिष्ठानच्या संपर्क क्रमांकावर (०२४६७-२०२५१४) पूर्वसूचना दिल्यास भाविकांची गैरसोय होणार नाही. तथापि अनोळखी व्यक्तींना रात्रीच्या मुक्कामाची अनुमती नसते. नवीन व अपरिचित व्यक्तीस मुक्कामासाठी यायचे असल्यास श्रीदासगणू परिवारातील अनुग्रहित सदस्यांच्या ओळखीच्या शिफारशीने अनुमती देण्याबाबत विचार होऊ शकतो. मात्र अशा नवीन व अपरिचित व्यक्तीच्या गोरट्यास भेट देण्याचा उद्देश केवळ कुतूहल/उत्सुकता हा नसावा; साधना-उपासना करणे हा उद्देश असणे अनिवार्य आहे. तसेच येथील दिनक्रमाचे व शिस्तीचे पालन करून शांतता व पावित्र्य सांभाळावेच लागेल.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<TableData> schedule = [
  TableData('१.', 'पहाटे ५:०० ते ५:१५', 'सूर्यनमस्कार'),
  TableData('२.', 'सकाळी ७:०० ते ७:१५', 'ध्यानमंदिरातील प्रार्थना'),
  TableData('३.', 'सकाळी ७:३० ते ८:००', 'सकाळची प्रार्थना'),
  TableData('४.', 'सकाळी ९:०० ते १०:३०', 'श्रींना अभिषेक व पूजा'),
  TableData('५.', 'दुपारी ११:३० ते १२:१५', 'श्रींना नैवेद्य, आरती व स्तोत्रे'),
  TableData('६.', 'सायंकाळी ६:४५ ते ८:१५', 'भजनावली, सायंआरती व स्तोत्रे'),
  TableData(
    '७.',
    'रात्रौ ९:०० ते ९:३०',
    'श्रीविष्णुसहस्त्रनाम पाठ, स्तोत्रे व कृपायाचना',
  ),
];
