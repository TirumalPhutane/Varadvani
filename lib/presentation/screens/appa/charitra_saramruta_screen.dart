import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/helper/helper.dart';
import 'package:varadvani/data/data_sources/local/local_datasource.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class CharitraSaramrutaScreen extends ConsumerWidget {
  const CharitraSaramrutaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeList = ref.watch(localDataSourceProvider).getEpisodes();

    return Scaffold(
      appBar: CustomAppBar(title: 'संजीवक चरित्र सारामृत'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 10,
              bottom: 15,
            ),
            child: Column(
              spacing: 15,
              children: [
                WidgetHelper.buildStartText(),
                WidgetHelper.buildNormalText(
                  '‘नर अगर करणी करें तो नर का नारायण हो जाय’ या उक्तीप्रमाणे नराचा नारायण कसा होऊ शकतो याचा आदर्श वस्तुपाठ म्हणजे पू. अप्पांचे जीवन! तरुण वयात नास्तिकतेकडे झुकलेले पू. अप्पा पुढे नंतर आस्तिकतेचे केवळ खंदे पुरस्कर्तेच झाले असे नाही तर साधकांसाठी दीपस्तंभ झाले. जीवनातील प्रत्येक चढउताराला स्थितप्रज्ञभावाने सामोरे जात, अत्यंत रसिकतेने जीवनाचा आस्वाद घेत, सामान्य जनांप्रमाणे प्रवृत्तीपर आयुष्य जगत असताना अविरत प्रयत्न व निष्ठापूर्वक सातत्य यांची कास धरून सद्गुरू कृपेने निवृत्तीपर जीवनाचा कळसाध्याय कसा गाठता येतो याचे मूर्तिमंत उदाहरण पू. अप्पांनी समाजापुढे प्रस्तुत केले आहे. अशा या विभूतीच्या जीवन चरित्राचा आरसा म्हणजे “तेजाचं चांदणं” हा ग्रंथ. पू. अप्पांच्या चरित्रग्रंथाला दिलेले “तेजाचं चांदणं” हे नाव अगदी यथार्थ आहे! पू. अप्पांचे जीवन म्हणजे प्रखर तेज आहे खरे पण ते तेज ‘तापहीन’ आहे. या ‘तेजोनिधी’ची शीतलता अनुभवायची असल्यास या ग्रंथाच्या सान्निध्यात जायला हवे. आपले स्वतःचे जीवन कृतार्थपूर्वक समाधानाने, अपार आनंदाने व अलौकिक समृद्धीने भरून टाकायचे असल्यास पू. अप्पांनी आयुष्यभर निष्ठापूर्वक जपलेली नीतिमूल्ये आपल्या जीवनात उतरविली पाहिजेत. यासाठी त्यांचा चरित्रग्रंथ सखोलपणे अभ्यासला पाहिजे.',
                ),
                WidgetHelper.buildNormalText(
                  'पू. अप्पांच्या जन्मशताब्दी वर्षाचे निमित्त साधून पुण्यातील एक सद्गृहस्थ श्री. सतीश निरंतर यांनी स्वतः पुढाकार घेवून आधुनिक तंत्रज्ञानाच्या आधारे पू. अप्पांचा हा चरित्र ग्रंथ साररूपात चित्रफितीद्वारे (video clip) उपलब्ध करून देण्याचा अत्यंत स्तुत्य उपक्रम हाती घेतला आहे. त्यांच्या या प्रयत्नामुळे पू. अप्पांचा चरित्र ग्रंथ दृकश्राव्य अशा एका वेगळ्या स्वरूपात उपलब्ध होत आहे. यासाठी श्री. सतीश निरंतर यांचे अभिनंदन! श्री. सतीश निरंतर तयार करीत असलेल्या चित्रफिती त्यांच्याच सौजन्याने या ॲपवर उपलब्ध केल्या आहेत. जिज्ञासूंनी याचा अवश्य लाभ घ्यावा.',
                ),
                Text(
                  '(चित्रफितीत समावेश असलेल्या विषयांचा / प्रसंगांचा आढावा व प्रत्येक चित्रफितीचा कालावधी खाली दिला आहे.)',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.orange).withValues(alpha: 0.7),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: episodeList.length,
                  itemBuilder: (context, index) {
                    final episode = episodeList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: buildCard(
                        episode.title,
                        episode.duration,
                        episode.videoUrl,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, String duration, String videoUrl) {
    return GestureDetector(
      onTap: () {
        Helper.launchUrlFromApp(videoUrl);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(ColorCode.white),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 15,
            right: 15,
          ),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mukta',
                        color: Color(ColorCode.black),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mukta_light',
                        color: Color(ColorCode.black),
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset('assets/svg/youtube.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
