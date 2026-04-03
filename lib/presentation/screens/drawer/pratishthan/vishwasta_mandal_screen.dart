import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class VishwastaMandalScreen extends StatelessWidget {
  const VishwastaMandalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.board_of_trustees,
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
                  '१९७४ या वर्षी जेव्हा “श्रीमद्सद्गुरू श्रीदासगणू महाराज प्रतिष्ठान” या नावाने प्रतिष्ठान पंजीकृत होवून कार्यान्वित झाले त्यावेळी खालील प्रमाणे विश्वस्त मंडळ कार्यरत होते.',
                ),
                WidgetHelper.tableHeader(
                  TableData('अ. क्र.', 'पदाधिकारी', 'दायित्व'),
                  0.4,
                  1.5,
                  0.7,
                ),
                ListView.separated(
                  itemCount: members.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return WidgetHelper.buildTable(member, 0.4, 1.4, 0.8);
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: WidgetHelper.buildNormalText(
                    'खालीलप्रमाणे विद्यमान विश्वस्त मंडळ कार्यरत आहे.',
                  ),
                ),
                WidgetHelper.tableHeader(
                  TableData('अ. क्र.', 'पदाधिकारी', 'दायित्व'),
                  0.4,
                  1.5,
                  0.7,
                ),
                ListView.separated(
                  itemCount: currentMembers.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final member = currentMembers[index];
                    return WidgetHelper.buildTable(member, 0.4, 1.4, 0.8);
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

List<TableData> members = [
  TableData('१.', 'मा. श्री. बाबासाहेब देशमुख, गोरठेकर', 'संस्थापक अध्यक्ष'),
  TableData('२.', 'मा. श्री. सूर्यकांतराव कवटीकवार', 'विश्वस्त'),
  TableData('३.', 'मा. श्री. प्रभाकरराव नांदेडकर', 'व्यवस्थापकीय विश्वस्त'),
];

List<TableData> currentMembers = [
  TableData('१.', 'मा. श्री. महेश अनंतराव आठवले', 'अध्यक्ष'),
  TableData('२.', 'मा. श्री. विक्रम विनायकराव नांदेडकर', 'विश्वस्त - सचिव'),
  TableData('३.', 'मा. कु. गार्गीताई (वसुमती) देशपांडे', 'सहसचिव'),
  TableData('४.', 'मा. श्री. गोविंद नारायणराव मुक्कावार', 'सहसचिव'),
  TableData('५.', 'मा. श्री. विकास सूर्यकांतराव कवटीकवार', 'विश्वस्त'),
  TableData(
    '६.',
    'मा. श्री. दिगंबरराव सीतारामपंत शेंदुरवाडकर',
    'व्यवस्थापकीय विश्वस्त',
  ),
];
