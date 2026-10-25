import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/data/data_sources/local/local_datasource.dart';
import 'package:varadvani/presentation/providers/audio/get_audios_provider.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';

class AppaAudioScreen extends ConsumerStatefulWidget {
  const AppaAudioScreen({super.key});

  @override
  ConsumerState<AppaAudioScreen> createState() => _AppaAudioScreenState();
}

class _AppaAudioScreenState extends ConsumerState<AppaAudioScreen> {
  bool isLoading = true;
  Map<String, String> get categories =>
      ref.watch(localDataSourceProvider).getAudioCategories();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getAudiosProvider.notifier).getAudios('Appa');
    });
  }

  @override
  Widget build(BuildContext context) {
    final audiosState = ref.watch(getAudiosProvider);

    return audiosState.isLoading
        ? Center(child: WidgetHelper.buildLoader())
        : audiosState.data!.data.isEmpty
        ? Center(
            child: Text(
              context.l10n.no_category,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Mukta_light',
                color: context.colors.onSurface,
                letterSpacing: 0,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              spacing: 15,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.shravyaGranthScreen,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            context.l10n.audio_books,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Mukta',
                              color: context.colors.onSurface,
                              letterSpacing: 0,
                              height: 1.5,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg/arrow.svg',
                            colorFilter: ColorFilter.mode(
                              context.colors.onSurface,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: audiosState.data!.data.length,
                    itemBuilder: (context, index) {
                      final categoryData = audiosState.data!.data[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: WidgetHelper.buildAudioCategoryCard(
                          context,
                          categoryData,
                          categories,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
