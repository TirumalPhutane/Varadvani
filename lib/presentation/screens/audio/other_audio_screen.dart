import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/domain/entities/audio/category_entity.dart';
import 'package:varadvani/presentation/providers/audio/get_audios_provider.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';
import 'package:varadvani/theme/color_code.dart';

class OtherAudioScreen extends ConsumerStatefulWidget {
  const OtherAudioScreen({super.key});

  @override
  ConsumerState<OtherAudioScreen> createState() => _OtherAudioScreenState();
}

class _OtherAudioScreenState extends ConsumerState<OtherAudioScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getAudiosProvider.notifier).getAudios('Other');
    });
  }

  @override
  Widget build(BuildContext context) {
    final audiosState = ref.watch(getAudiosProvider);

    return audiosState.isLoading
        ? Center(child: WidgetHelper.buildLoader())
        : Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView.builder(
              itemCount: audiosState.data!.data.length,
              itemBuilder: (context, index) {
                final categoryData = audiosState.data!.data[index];
                //final items = audiosState.data!.data[index].items;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: buildCard(categoryData),
                );
              },
            ),
          );
  }

  Widget buildCard(CategoryEntity categoryData) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.audioListScreen,
        arguments: categoryData,
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
                      categoryData.category,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Mukta',
                        color: Color(ColorCode.black),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      '${categoryData.items.length} Audios',
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
