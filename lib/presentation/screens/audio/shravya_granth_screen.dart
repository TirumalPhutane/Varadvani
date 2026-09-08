import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/domain/entities/audio/shravya_entity.dart';
import 'package:varadvani/presentation/providers/audio/get_shravya_provider.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class ShravyaGranthScreen extends ConsumerStatefulWidget {
  const ShravyaGranthScreen({super.key});

  @override
  ConsumerState<ShravyaGranthScreen> createState() =>
      _ShravyaGranthScreenState();
}

class _ShravyaGranthScreenState extends ConsumerState<ShravyaGranthScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getShravyaProvider.notifier).getShravyaGranth();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shravyaGranthState = ref.watch(getShravyaProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'श्राव्य ग्रंथ'),
      body: shravyaGranthState.isLoading || shravyaGranthState.data == null
          ? Center(child: WidgetHelper.buildLoader())
          : shravyaGranthState.data!.data.isEmpty
          ? Center(
              child: Text(
                'कोणतेही ग्रंथ उपलब्ध नाहीत.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Mukta_light',
                  color: Color(ColorCode.black),
                  letterSpacing: 0,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListView.builder(
                itemCount: shravyaGranthState.data!.data.length,
                itemBuilder: (context, index) {
                  final granthData = shravyaGranthState.data!.data[index];
                  //final items = audiosState.data!.data[index].items;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: buildCard(granthData),
                  );
                },
              ),
            ),
    );
  }

  Widget buildCard(ShravyaEntity granthData) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.granthListScreen,
        arguments: granthData,
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      granthData.granth,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mukta',
                        color: Color(ColorCode.black),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      '${granthData.items.length} Audios',
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
