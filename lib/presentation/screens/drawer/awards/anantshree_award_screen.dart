import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class AnantshreeAwardScreen extends StatelessWidget {
  const AnantshreeAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'अनंतश्री पुरस्कार'),
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
                  'हिंदू राष्ट्र, हिंदू संस्कृति, वेद व आयुर्वेद हे पू. अप्पांच्या अत्यंत जिव्हाळ्याचे विषय होते. धर्मकार्य, देशकार्य व संस्कृतीच्या संवर्धनासाठी उत्तम कार्य करणाऱ्या व्यक्ती अथवा संस्था यांना पाठबळ देण्यासाठी, त्यांनी घेतलेल्या निस्पृह कष्टाची, केलेल्या नि:स्वार्थ त्यागाची दखल घ्यावी व त्यांचे महनीय कार्य समाजापुढे यावे, या हेतूने श्रीदासगणू महाराजांच्या स्मृतिप्रीत्यर्थ “श्रीदासगणू पुरस्कार” प्रदान करण्याची योजना त्यांनी स्वतःच्या हयातीतच कार्यान्वित केली होती. त्याच धर्तीवर पू. अप्पांनी देह ठेवल्यानंतर त्यांच्या स्मृतिप्रीत्यर्थ पुरस्कार प्रदान करण्याची योजना तयार करण्यात आली. त्यासाठी “इंदिरा सेवा समिती” या नावाने एक समिती गठीत करून पुस्कारार्थींची निवड करण्याचे दायित्व या समितीला सोपविण्यात आले. “अनंतश्री पुरस्कार” असे या पुरस्काराचे नामकरण करून पू. अप्पांच्या जिव्हाळ्याचे अन्य दोन विषय, ‘वेद’ आणि ‘आयुर्वेद’ हे या पुरस्काराचे कार्यक्षेत्र म्हणून निश्चित केले आहेत. पू. अप्पांच्या स्मरण महोत्सवात हा पुरस्कार प्रदान केला जातो.',
                ),
                WidgetHelper.buildNormalText(
                  'एका वर्षी वैदिकाला व एका वर्षी आयुर्वेदाच्या कार्याशी निगडित व्यक्ती अथवा संस्थांना पाठबळ देण्यासाठी व त्यांचे कार्य जनसामान्यांपुढे यावे, या हेतूने सन्मानित करण्याचे निश्चित केले आहे. शाल, श्रीफल, स्मृतिचिन्ह व रोखरक्कम असे या पुरस्काराचे स्वरूप आहे. २१ सहस्र रुपयांपासून सुरु केलेला पुरस्कार सध्या ३५ सहस्र रुपयांपर्यंत वाढवीत नेला आहे. वेद, वैदिक धर्म, आयुर्वेद या क्षेत्रात भरीव योगदान देणाऱ्या खालील मान्यवरांना इ. स. २००९ पासून “अनंतश्री पुरस्कार” पुरस्काराने सन्मानित करण्यात आले आहे.',
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
  TableData('१.', '2009', 'वे. शा. सं. श्री. विश्वासशास्त्री घोडजकर, नांदेड'),
  TableData('२.', '2010', 'वैद्य श्री. सुभाष रानडे, पुणे'),
  TableData('३.', '2011', 'वे. शा. सं. श्री. दिनकरशास्त्री फडके गुरुजी, पुणे'),
  TableData('४.', '2012', 'वैद्य श्री. जयंत दातार, पुणे'),
  TableData('५.', '2013', 'वे. शा. सं. श्री. नवाथे गुरुजी, पुणे'),
  TableData('६.', '2014', 'वैद्य श्री. संतोष नेवपूरकर, छ. संभाजीनगर'),
  TableData('७.', '2015', 'वे. शा. सं. श्री. प्रमोदशास्त्री कुलकर्णी, परभणी'),
  TableData('८.', '2016', 'वैद्य श्री. अतुल निरगुडे, लातूर'),
  TableData('९.', '2017', 'वेद वेदांग समिती, मोठी लाठ, ता. कंधार, जि. नांदेड'),
  TableData('१०.', '2018', 'वैद्य श्री. विनय वासुदेव वेलणकर, डोंबिवली'),
  TableData(
    '११.',
    '2019',
    'वे. शा. सं. श्री. दत्तात्रय मोरवणे, वायंगणी, जि. सिंधुदुर्ग',
  ),
  TableData('१२.', '2022', 'वे. शा. सं. श्रीपादशास्त्री धायगुडे, पुणे'),
  TableData('१३.', '2023', 'वैद्य अविनाश मोरेश्वर लेले, पुणे'),
];
