import 'package:flutter/material.dart';
import 'package:varadvani/data/timeline_item.dart';
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
              bottom: 20,
            ),
            child: Column(
              spacing: 20,
              children: [
                WidgetHelper.buildStartText(),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: timeline.length,
                    itemBuilder: (context, index) {
                      final item = timeline[index];
                      final isLeft = index % 2 == 0;
                      final isLast = index == timeline.length - 1;

                      return isLeft
                          ? _buildJeevanpatCardLeft(context, item, isLast)
                          : _buildJeevanpatCardRight(context, item, isLast);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJeevanpatCardRight(
    BuildContext context,
    TimelineItem item,
    bool isLast,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isLast)
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scaleByDouble(-1.0, 1.0, 1.0, 1.0),
                child: Image.asset('assets/image/dotted_line.png'),
              ),
            ),
          )
        else
          SizedBox(
            width: Image.asset('assets/image/dotted_line.png').width ?? 50,
          ),
        FlippableCard(item: item, isRight: true),
      ],
    );
  }
}

Widget _buildJeevanpatCardLeft(
  BuildContext context,
  TimelineItem item,
  bool isLast,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FlippableCard(item: item, isRight: false),
      if (!isLast)
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/image/dotted_line.png'),
          ),
        )
      else
        const SizedBox(width: 50),
    ],
  );
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
    description: 'शिक्षणाचा त्याग व बडोद्याला नोकरी',
    backContent: 'शिक्षणाचा त्याग व बडोद्याला नोकरी',
  ),
  TimelineItem(
    year: '1892',
    age: 'वय - 24',
    description: 'विवाह – नोकरी त्याग – पुण्यश्लोक अहिल्यानगरला वापसी',
    backContent: 'विवाह – नोकरी त्याग – पुण्यश्लोक अहिल्यानगरला वापसी',
  ),
  TimelineItem(
    year: '1893',
    age: 'वय - 25',
    description:
        'मानी स्वभावामुळे गृहत्याग; पोलिसात भरती – श्रीगोंदा येथे प्रथम नियुक्ती',
    backContent:
        'मानी स्वभावामुळे गृहत्याग; पोलिसात भरती – श्रीगोंदा येथे प्रथम नियुक्ती',
  ),
  TimelineItem(
    year: '1894',
    age: 'वय - 26',
    description: 'शिर्डीला श्रीसाईबाबांचे प्रथम दर्शन',
    backContent: 'शिर्डीला श्रीसाईबाबांचे प्रथम दर्शन',
  ),
  TimelineItem(
    year: '1896',
    age: 'वय - 28',
    description: 'सद्गुरु श्रीवामनशास्त्री इस्लामपूरकर यांची भेट व उपदेश',
    backContent: 'सद्गुरु श्रीवामनशास्त्री इस्लामपूरकर यांची भेट व उपदेश',
  ),
  TimelineItem(
    year: '1897',
    age: 'वय - 29',
    description:
        'श्रीवामनशास्त्री काशीला रवाना व तिथेच ज्येष्ठ वद्य एकादशीला निर्वाण',
    backContent:
        'श्रीवामनशास्त्री काशीला रवाना व तिथेच ज्येष्ठ वद्य एकादशीला निर्वाण',
  ),
  TimelineItem(
    year: '1897',
    age: 'वय - 29',
    description:
        'जामखेडला बदली. तिथे स्वरचित कीर्तनाचा ओनामा व श्रीसाईबाबांच्या आदेशान्वये ओवीबद्ध संतचरित्रे लिखाणाचा श्रीगणेशा',
    backContent:
        'जामखेडला बदली. तिथे स्वरचित कीर्तनाचा ओनामा व श्रीसाईबाबांच्या आदेशान्वये ओवीबद्ध संतचरित्रे लिखाणाचा श्रीगणेशा',
  ),
  TimelineItem(
    year: '1898',
    age: 'वय - 30',
    description: 'जीवनाला कलाटणी देणारे दरोडेखोर कान्ह्या भिल्लाचे प्रकरण',
    backContent: 'जीवनाला कलाटणी देणारे दरोडेखोर कान्ह्या भिल्लाचे प्रकरण',
  ),
  TimelineItem(
    year: '1899',
    age: 'वय - 31',
    description: 'श्रीसाईबाबांचा नोकरी सोडण्यासाठी तगादा',
    backContent: 'श्रीसाईबाबांचा नोकरी सोडण्यासाठी तगादा',
  ),
  TimelineItem(
    year: '1901',
    age: 'वय - 33',
    description: 'जामखेडहून नेवासा येथे बदली',
    backContent: 'जामखेडहून नेवासा येथे बदली',
  ),
  TimelineItem(
    year: '1902',
    age: 'वय - 34',
    description:
        'नेवासा येथे मोहिनीराजाच्या मंदिरात शेवटचा तमाशा सादर करून रचलेल्या सर्व लावण्या जाळल्या',
    backContent:
        'नेवासा येथे मोहिनीराजाच्या मंदिरात शेवटचा तमाशा सादर करून रचलेल्या सर्व लावण्या जाळल्या',
  ),
  TimelineItem(
    year: '1904',
    age: 'वय - 36',
    description: 'पोलिसातील नोकरीचे त्यागपत्र',
    backContent: 'पोलिसातील नोकरीचे त्यागपत्र',
  ),
  TimelineItem(
    year: '1905',
    age: 'वय - 37',
    description: 'श्रीसाईबाबांच्या आदेशान्वये मराठवाड्यातील नांदेडला आगमन',
    backContent: 'श्रीसाईबाबांच्या आदेशान्वये मराठवाड्यातील नांदेडला आगमन',
  ),
  TimelineItem(
    year: '1907',
    age: 'वय - 39',
    description: 'मानसपुत्र श्री. दामोदर वामन आठवले यांची पुण्यात प्रथम भेट',
    backContent: 'मानसपुत्र श्री. दामोदर वामन आठवले यांची पुण्यात प्रथम भेट',
  ),
  TimelineItem(
    year: '1914',
    age: 'वय - 46',
    description:
        'श्रीसाईबाबांच्या सांगण्यानुसार श्री.दामू अण्णा यांचा सौ.राधा यांचेशी विवाह',
    backContent:
        'श्रीसाईबाबांच्या सांगण्यानुसार श्री.दामू अण्णा यांचा सौ.राधा यांचेशी विवाह',
  ),
  TimelineItem(
    year: '15/10/1918',
    age: 'वय - 50',
    description: 'विजयादशमीला शिर्डीत श्रीसाईबाबांनी देह ठेवला',
    backContent: 'विजयादशमीला शिर्डीत श्रीसाईबाबांनी देह ठेवला',
  ),
  TimelineItem(
    year: '27/09/1920',
    age: 'वय - 52',
    description: 'शके १८४२ च्या अनंतचतुर्दशीला पू. अप्पांचा जन्म',
    backContent: 'शके १८४२ च्या अनंतचतुर्दशीला पू. अप्पांचा जन्म',
  ),
  TimelineItem(
    year: '1922',
    age: 'वय - 54',
    description:
        'श्रीसाईबाबा संस्थानची स्थापना; श्रीदासगणु महाराज प्रथम अध्यक्ष',
    backContent:
        'श्रीसाईबाबा संस्थानची स्थापना; श्रीदासगणु महाराज प्रथम अध्यक्ष',
  ),
  TimelineItem(
    year: '1924',
    age: 'वय - 56',
    description: 'मानसपुत्र श्री दामूअण्णांचे पंढरपुरात दुःखद निधन',
    backContent: 'मानसपुत्र श्री दामूअण्णांचे पंढरपुरात दुःखद निधन',
  ),
  TimelineItem(
    year: '1937',
    age: 'वय - 69',
    description: 'लोणावळ्यात श्रीराम मंदिरात गंगादशहरा उत्सवास प्रारंभ',
    backContent: 'लोणावळ्यात श्रीराम मंदिरात गंगादशहरा उत्सवास प्रारंभ',
  ),
  TimelineItem(
    year: '1940',
    age: 'वय - 72',
    description: '‘श्रीगजाननविजय’ ग्रंथ लेखन पूर्ण',
    backContent: '‘श्रीगजाननविजय’ ग्रंथ लेखन पूर्ण',
  ),
  TimelineItem(
    year: '1951',
    age: 'वय - 83',
    description: 'गोरट्यात श्रीरुक्मिणीपांडुरंगाची स्थापना',
    backContent: 'गोरट्यात श्रीरुक्मिणीपांडुरंगाची स्थापना',
  ),
  TimelineItem(
    year: '1954',
    age: 'वय - 86',
    description: 'गोरट्यात श्रीशनिदेवाची स्थापना',
    backContent: 'गोरट्यात श्रीशनिदेवाची स्थापना',
  ),
  TimelineItem(
    year: '1954',
    age: 'वय - 86',
    description: 'शिर्डीत श्रीसाईबाबांच्या मूर्तीची प्रतिष्ठापना',
    backContent: 'शिर्डीत श्रीसाईबाबांच्या मूर्तीची प्रतिष्ठापना',
  ),
  TimelineItem(
    year: '1956',
    age: 'वय - 88',
    description: '‘श्रीदासगणू महाराज – व्यक्ती आणि वाङ्मय’ ग्रंथ प्रकाशन',
    backContent: '‘श्रीदासगणू महाराज – व्यक्ती आणि वाङ्मय’ ग्रंथ प्रकाशन',
  ),
  TimelineItem(
    year: '1958',
    age: 'वय - 90',
    description: 'पुण्यश्लोक अहिल्यानगर येथे सत्कार स्वीकारला',
    backContent: 'पुण्यश्लोक अहिल्यानगर येथे सत्कार स्वीकारला',
  ),
  TimelineItem(
    year: '26/11/1962',
    age: 'वय - 94',
    description: 'पंढरपुरात महानिर्वाण',
    backContent: 'पंढरपुरात महानिर्वाण',
  ),
];
