import 'package:flutter/material.dart';
import 'package:varadvani/data/timeline_item.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/flippable_card.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';

class AppaJeevanpatScreen extends StatelessWidget {
  const AppaJeevanpatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'पू. अप्पांचा जीवनपट'),
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
    year: '1914',
    date: '—',
    age: '—',
    description:
        'श्रीसाईबाबांच्या सांगण्यानुसार श्री.दामू अण्णा यांचा सौ.राधा (पू. अप्पांचे पिता-माता) यांचेशी विवाह. या विवाहास श्रीसाईबाबांची उपस्थिती होती',
    backContent:
        'श्रीसाईबाबांच्या सांगण्यानुसार श्री.दामू अण्णा यांचा सौ.राधा (पू. अप्पांचे पिता-माता) यांचेशी विवाह. या विवाहास श्रीसाईबाबांची उपस्थिती होती',
  ),
  TimelineItem(
    year: '27/09/1920',
    date: 'भाद्रपद शु.१४, १८४२',
    age: 'प्रारंभ',
    description: 'पुणे येथे अनंतचतुर्दशीला पू. अप्पांचा जन्म',
    backContent: 'पुणे येथे अनंतचतुर्दशीला पू. अप्पांचा जन्म',
  ),
  TimelineItem(
    year: '1924',
    date: 'पौष शु.१०, १८४५',
    age: 'वय - 04',
    description: 'ती. दामूअण्णांचे पंढरपुरात दुःखद निधन',
    backContent: 'ती. दामूअण्णांचे पंढरपुरात दुःखद निधन',
  ),
  TimelineItem(
    year: '1928',
    date: '१८५०',
    age: 'वय - 08',
    description: 'मौंजी बंधन',
    backContent: 'मौंजी बंधन',
  ),
  TimelineItem(
    year: '1936',
    date: '१८५७',
    age: 'वय - 16',
    description: 'कीर्तनाचा ओनामा',
    backContent: 'कीर्तनाचा ओनामा',
  ),
  TimelineItem(
    year: '03/05/1940',
    date: 'चैत्र व.११, १८६२',
    age: 'वय - 20',
    description: 'श्रीशालिवाहन काव्यलेखन प्रारंभ',
    backContent: 'श्रीशालिवाहन काव्यलेखन प्रारंभ',
  ),
  TimelineItem(
    year: '19/02/1941',
    date: 'माघ व.८, १८६३',
    age: 'वय - 21',
    description: 'पंढरपूर येथे सौ.इंदिरा यांचेशी विवाह (गोरजमुहूर्त)',
    backContent: 'पंढरपूर येथे सौ.इंदिरा यांचेशी विवाह (गोरजमुहूर्त)',
  ),
  TimelineItem(
    year: '1944',
    date: '१८६६',
    age: 'वय - 24',
    description: 'आयुर्विद्या विशारद',
    backContent: 'आयुर्विद्या विशारद',
  ),
  TimelineItem(
    year: '1950',
    date: '१८७२',
    age: 'वय - 30',
    description: 'आयुर्विद्या पारंगत',
    backContent: 'आयुर्विद्या पारंगत',
  ),
  TimelineItem(
    year: '16/08/1950',
    date: 'श्रावण शु.३, १८७२',
    age: 'वय - 30',
    description: 'श्रीकृष्णकथामृत (महाकाव्य) प्रकाशन',
    backContent: 'श्रीकृष्णकथामृत (महाकाव्य) प्रकाशन',
  ),
  TimelineItem(
    year: '16/06/1961',
    date: 'निज ज्येष्ठ शु.३, १८८३',
    age: 'वय - 41',
    description:
        'पुण्यातील टिळक आयुर्वेदिक महाविद्यालयच्या प्राचार्य पदाचा कार्यभार स्वीकारला',
    backContent:
        'पुण्यातील टिळक आयुर्वेदिक महाविद्यालयच्या प्राचार्य पदाचा कार्यभार स्वीकारला',
  ),
  TimelineItem(
    year: '25/11/1962',
    date: 'कार्तिक व.१३, १८८४',
    age: 'वय - 42',
    description: 'पंढरपुरात पू.दासगणू महाराजांचे निर्वाण',
    backContent: 'पंढरपुरात पू.दासगणू महाराजांचे निर्वाण',
  ),
  TimelineItem(
    year: '25/04/1966',
    date: 'चैत्र व.१०, १८८८',
    age: 'वय - 46',
    description: 'राष्ट्रीय शिक्षण मंडळाचे त्यागपत्र',
    backContent: 'राष्ट्रीय शिक्षण मंडळाचे त्यागपत्र',
  ),
  TimelineItem(
    year: '07/01/1968 - 12/01/1968',
    date: 'पौष शु.०८ ते १२, १८८९',
    age: 'वय - 48',
    description: 'पू. दासगणू महाराजांचा जन्मशताब्दी महोत्सव',
    backContent: 'पू. दासगणू महाराजांचा जन्मशताब्दी महोत्सव',
  ),
  TimelineItem(
    year: '16/08/1971',
    date: 'श्रावण व.११, १८९३',
    age: 'वय - 51',
    description: 'गंगोत्री येथे श्रीवरद नारायण दर्शन',
    backContent: 'गंगोत्री येथे श्रीवरद नारायण दर्शन',
  ),
  TimelineItem(
    year: '26/02/1973',
    date: 'दासनवमी १८९४',
    age: 'वय - 53',
    description: 'अनुग्रह देण्यास सुरुवात',
    backContent: 'अनुग्रह देण्यास सुरुवात',
  ),
  TimelineItem(
    year: '10/01/1974',
    date: 'पौष, १८९६',
    age: 'वय - 54',
    description: 'गोरटे येथे ‘श्रीदासगणू महाराज प्रतिष्ठान’ स्थापना',
    backContent: 'गोरटे येथे ‘श्रीदासगणू महाराज प्रतिष्ठान’ स्थापना',
  ),
  TimelineItem(
    year: '09/09/1976',
    date: 'भाद्रपद व.१, १८९८',
    age: 'वय - 56',
    description: 'प्रथम सिंधु स्नान',
    backContent: 'प्रथम सिंधु स्नान',
  ),
  TimelineItem(
    year: '05/09/1981',
    date: 'भाद्रपद शु.७, १९०३',
    age: 'वय - 61',
    description: 'कैलास-मानस यात्रा',
    backContent: 'कैलास-मानस यात्रा',
  ),
  TimelineItem(
    year: '29/05/1982',
    date: 'वैशाख व.११, १९०४',
    age: 'वय - 62',
    description: '‘श्रीराधादामोदर प्रतिष्ठान’ स्थापना',
    backContent: '‘श्रीराधादामोदर प्रतिष्ठान’ स्थापना',
  ),
  TimelineItem(
    year: '15/08/1986 - 14/10/1986',
    date: 'श्रावण शु.१० ते अश्विन शु.१२, १९०८',
    age: 'वय - 66',
    description: 'सपत्नीक चारधाम यात्रा सांगता',
    backContent: 'सपत्नीक चारधाम यात्रा सांगता',
  ),
  TimelineItem(
    year: '02/01/1988 - 12/01/1988',
    date: 'पौष शु.१४ ते व.९, १९०९',
    age: 'वय - 68',
    description: 'नांदेड स्मरण महोत्सव',
    backContent: 'नांदेड स्मरण महोत्सव',
  ),
  TimelineItem(
    year: '10/12/1990',
    date: 'मार्गशीर्ष व.९, १९१२',
    age: 'वय - 70',
    description: 'पुणे येथे मातोश्रींचे निर्वाण',
    backContent: 'पुणे येथे मातोश्रींचे निर्वाण',
  ),
  TimelineItem(
    year: '10/04/1991',
    date: 'चैत्र व.११, १९१३',
    age: 'वय - 71',
    description: 'संन्यास दीक्षा ग्रहण (उत्तरकाशी)',
    backContent: 'संन्यास दीक्षा ग्रहण (उत्तरकाशी)',
  ),
  TimelineItem(
    year: '04/05/1993',
    date: 'वैशाख शु.१३, १९१५',
    age: 'वय - 73',
    description: 'समाधी मंदिर कलशारोहन',
    backContent: 'समाधी मंदिर कलशारोहन',
  ),
  TimelineItem(
    year: '1995',
    date: 'आषाढ शु.११, १९१७',
    age: 'वय - 75',
    description: '‘संस्कृति विचार सेवक संघ’ स्थापना',
    backContent: '‘संस्कृति विचार सेवक संघ’ स्थापना',
  ),
  TimelineItem(
    year: '1997',
    date: '१९१९',
    age: 'वय - 77',
    description: '‘श्रीसंत विद्या प्रबोधिनी’ निर्मिती',
    backContent: '‘श्रीसंत विद्या प्रबोधिनी’ निर्मिती',
  ),
  TimelineItem(
    year: '05/05/1999',
    date: 'वैशाख १९२१',
    age: 'वय - 79',
    description: 'दामोदराश्रम जीर्णोद्धार',
    backContent: 'दामोदराश्रम जीर्णोद्धार',
  ),
  TimelineItem(
    year: '25/01/2002',
    date: 'पौष शु.११, १९२३',
    age: 'वय - 82',
    description: 'मनुस्मृति प्रकाशन',
    backContent: 'मनुस्मृति प्रकाशन',
  ),
  TimelineItem(
    year: '03/09/2002',
    date: 'श्रावण व.११, १९२४',
    age: 'वय - 82',
    description: 'महासमाधी प्रस्थान',
    backContent: 'महासमाधी प्रस्थान',
  ),
  TimelineItem(
    year: '05/09/2002',
    date: 'श्रावण व.१३, १९२४',
    age: 'वय - 82',
    description: 'महासमाधी सांगता',
    backContent: 'महासमाधी सांगता',
  ),
  TimelineItem(
    year: '20/09/2002',
    date: 'भाद्रपद शु.१४, १९२४',
    age: 'वय - 82',
    description: 'षोडशी कार्यक्रम (गोरटे)',
    backContent: 'षोडशी कार्यक्रम (गोरटे)',
  ),
];
