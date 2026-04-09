import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:varadvani/data/table_data.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class DadaGranthSampadaScreen extends StatelessWidget {
  const DadaGranthSampadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'पू. दादांची ग्रंथसंपदा'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetHelper.buildStartText(),
              Expanded(
                child: Column(
                  children: [
                    WidgetHelper.tableHeader(
                      TableData('ग्रंथाचे नाव', 'माहिती', 'मूल्य'),
                      0.7,
                      1.5,
                      0.5,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: booksData.length,
                        itemBuilder: (context, index) {
                          final member = booksData[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 10 : 0,
                              bottom: index == booksData.length - 1 ? 15 : 0,
                            ),
                            child: WidgetHelper.buildTable(
                              member,
                              0.6,
                              1.4,
                              0.5,
                            ),
                          );
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<TableData> booksData = [
  TableData(
    "अमृतानुभव भावार्थमंजिरी",
    "श्रीज्ञानेश्वरांच्या ‘अमृतानुभव’ ग्रंथावरील श्रीमहाराजांचे सर्वजन सुलभ भाष्य",
    "200/-",
  ),
  TableData(
    "उपदेशपर पद्ये",
    "पूर्वरंगासाठी आवश्यक असलेल्या पद्यांचा संग्रह",
    "20/-",
  ),
  TableData("उद्धवागमन", "श्रीमहाराजांनी रचलेले भावमधूर खंडकाव्य", "25/-"),
  TableData("छात्रबोध", "श्रीमहाराजांनी श्रीअंतरावांना केलेला बोध", "8/-"),
  TableData("हितबोध", "श्रीदासगणू महाराजांचे राष्ट्रोद्धारक विचार", "6/-"),
  TableData(
    "पासष्टीभावार्थदीपिका",
    "श्रीज्ञानेश्वरांनी चांगदेवाच्या कोऱ्या पत्राला उत्तर म्हणून लिहिलेल्या पासष्ट ओव्यांवरील भाष्य",
    "40/-",
  ),
  TableData(
    "पुरवणी खंड",
    "श्रीदासगणू महाराजांच्या समग्र वाड्.मयाचा पुरवणी खंड",
    "उपलब्ध नाही",
  ),
  TableData(
    "पोवाडे",
    "श्रीमहाराज रचित तानाजी मालुसरे, झाशीची राणी इ. पोवाडे",
    "30/-",
  ),
  TableData("भक्तिरसायन भावदीपिका", "", "13/-"),
  TableData(
    "भजनावली (आवृत्ती ८ वी)",
    "श्रीदासगणू महाराज रचित सायंकाळची भजने",
    "15/-",
  ),
  TableData(
    "श्री गुरूचरित्र सारामृत",
    "मूळ गुरुचरित्रातील सर्व कथाप्रसंग साररुपाने व सुलभतेने रचलेले श्रीमहाराजांचे प्रासादिक काव्य",
    "80/-",
  ),
  TableData(
    "श्रीगोदामहात्म्य",
    "ब्रह्मपुराणातील मुळ गोदामहात्म्याचे आधारे श्रीमहाराजांची लिहिलेला ओवीबध्द ग्रंथ",
    "80/-",
  ),
  TableData(
    "श्रीगौडपादकारिका (विवरण)",
    "श्रीगौडपाद यांच्या कारिकांचा श्रीमहाराजांनी अत्यंत सोप्या भाषेत केलेला ओवीबद्ध अनुवाद",
    "50/-",
  ),
  TableData(
    "श्रीईशावास्य भावार्थ बोधिनी व मंत्रार्थ प्रकाशिका",
    "मानवाला सत्याचे ज्ञान करवून देणाऱ्या ईशावास्य उपनिषदावरील श्रीमहाराजांची ओवीबध्द टीका",
    "60/-",
  ),
  TableData(
    "श्रीनागझरी महात्म्य",
    "विदर्भातील गोमाजी महाराजांचे ओवीबद्ध चरित्र",
    "40/-",
  ),
  TableData(
    "श्रीनारद-भक्तिसूत्र-बोधिनी",
    "देवर्षी नारदांच्या भक्तीपर ८४ सूत्रावरील श्रीमहाराजांची ओवीबद्ध टिका",
    "55/-",
  ),
  TableData(
    "श्रीभक्तिलीलामृत (अर्वाचीन)",
    "श्रीसाईनाथांच्या आज्ञेवरुन श्रीमहाराजांनी लिहिलेली संताची ओवीबद्ध चरित्रे",
    "200/-",
  ),
  TableData(
    "श्रीभक्तिसारामृत",
    "महिपतीबुवानंतर झालेल्या संताची श्री महाराजांनी लिहिलेली ओवीबद्ध संतचरित्रे",
    "150/-",
  ),
  TableData(
    "श्रीसंतकथामृत (अर्वाचीन)",
    "श्रीसाईनाथांच्या आज्ञेवरुन श्रीमहाराजांनी लिहिलेली संतांची ओवीबद्ध चरित्रे",
    "75/-",
  ),
  TableData(
    "श्रीमांगीशमाहात्म्य",
    "शिखर – शिंगणापूर महादेवाचे महात्म्य",
    "60/-",
  ),
  TableData(
    "श्रीविष्णुसहस्रनामबोधिनी",
    "श्रीविष्णुसहस्रनामाचे श्रीमहाराजांनी रचलेले ओवीबद्ध साररुप",
    "20/-",
  ),
  TableData("श्रीमध्वविजय", "श्री मध्वाचार्यावरील चरित्रपर ग्रंथ", "50/-"),
  TableData(
    "श्रीशंकराचार्य चरित्र (ओवीबद्ध)",
    "आद्य शंकराचार्यांचे श्रीमहाराजांनी रचलेले भक्तिरसप्रसाधन चरित्र",
    "250/-",
  ),
  TableData(
    "श्रीशंडिल्य भक्तिसूत्र भावदीपिका",
    "संस्कृत शांडिल्यसूत्रावर श्रीमहाराजांची ओवीबद्ध टिका",
    "50/-",
  ),
  TableData("श्रीशनिप्रताप", "श्री दासगणूमहाराज रचित ओवीबद्ध ग्रंथ", "25/-"),
  TableData(
    "सुबोध लघुकथा",
    "अनेक प्रकाराने हितोपदेश करणाऱ्या गद्य कथा",
    "30/-",
  ),
];
