import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/helper/helper.dart';
import 'package:varadvani/data/data_sources/local/local_datasource.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class RelatedWebsitesScreen extends ConsumerWidget {
  const RelatedWebsitesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linksList = ref.watch(localDataSourceProvider).getLinks();

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.related_websites,
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
              spacing: 15,
              children: [
                WidgetHelper.buildStartText(),
                Text(
                  'आ नो भद्रा: क्रतवो यन्तु विश्वत: l',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Mukta_medium',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                    color: Color(ColorCode.orange),
                  ),
                ),
                WidgetHelper.buildRichText(
                  'अर्थात, ',
                  'प्रत्येक बाजूने चांगले विचार आपल्याकडे येऊ देत. ऋग्वेदातील या वचनास अनुसरून अन्य संस्थानची आणि आपल्या विचारधारेशी समांतर व पूरक अशी इतर संकेतस्थळे खाली दिली आहेत. या संकेतस्थळांचा जिज्ञासू भाविकांना नक्कीच उपयोग होईल, असा विश्वास आहे.',
                  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.black),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                  TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.black),
                    letterSpacing: 0,
                    height: 1.5,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: linksList.length,
                  itemBuilder: (context, index) {
                    final link = linksList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: buildCard(
                        link.title,
                        link.duration,
                        link.videoUrl,
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
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Mukta',
                    color: Color(ColorCode.black),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                  color: Color(ColorCode.orange).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    //horizontal: 2,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/arrow.svg',
                    width: 18,

                    colorFilter: ColorFilter.mode(
                      Color(ColorCode.orange),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
