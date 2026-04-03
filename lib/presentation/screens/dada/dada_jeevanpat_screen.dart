import 'package:flutter/material.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/flippable_card.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';

class DadaJeevanpatScreen extends StatelessWidget {
  const DadaJeevanpatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'पू. दादांचा जीवनपट'),
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: timeline.length,
                  itemBuilder: (context, index) {
                    final item = timeline[index];
                    final isLeft = index % 2 == 0;

                    return isLeft
                        ? _buildJeevanpatCardLeft(context, item)
                        : _buildJeevanpatCardRight(context, item);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJeevanpatCardRight(BuildContext context, TimelineItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scaleByDouble(-1.0, 1.0, 1.0, 1.0),
              child: Image.asset('assets/image/dotted_line.png'),
            ),
          ),
        ),
        FlippableCard(item: item, isRight: true),
      ],
    );
  }
}

Widget _buildJeevanpatCardLeft(BuildContext context, TimelineItem item) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FlippableCard(item: item, isRight: false),
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset('assets/image/dotted_line.png'),
        ),
      ),
    ],
  );
}

class TimelineItem {
  final String year;
  final String age;
  final String description;
  final String backContent;

  TimelineItem({
    required this.year,
    required this.age,
    required this.description,
    required this.backContent,
  });
}

List<TimelineItem> timeline = [
  TimelineItem(
    year: '06/01/1868',
    age: 'प्रारंभ',
    description:
        'पौष शु. एकादशी शके १७८९ या तिथीला अकोळनेर, जि. पुण्यश्लोक अहिल्यानगर, येथे सहस्रबुद्धे यांच्या कुळात श्री.दत्तात्रेय व सौ.सावित्री यांच्या पोटी श्रीदासगणू महाराजांचा जन्म',
    backContent:
        'पौष शु. एकादशी शके १७८९ या तिथीला अकोळनेर, जि. पुण्यश्लोक अहिल्यानगर, येथे सहस्रबुद्धे यांच्या कुळात श्री.दत्तात्रेय व सौ.सावित्री यांच्या पोटी श्रीदासगणू महाराजांचा जन्म',
  ),
  TimelineItem(
    year: '1877',
    age: 'वय - 09',
    description: 'मौंजी बंधन',
    backContent: 'मौंजी बंधन',
  ),
  TimelineItem(
    year: '1878',
    age: 'वय - 10',
    description: 'शिक्षणास सुरुवात',
    backContent: 'शिक्षणास सुरुवात',
  ),
  TimelineItem(
    year: '1890',
    age: 'वय - 22',
    description: 'शिक्षणाचा त्याग व वडिलांना नोकरी',
    backContent: 'शिक्षणाचा त्याग व वडिलांना नोकरी',
  ),
];
