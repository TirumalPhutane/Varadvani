import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/data/data_sources/local/local_datasource.dart';
import 'package:varadvani/presentation/providers/audio/get_audios_provider.dart';
import 'package:varadvani/presentation/widgets/widget_helper.dart';

class OtherAudioScreen extends ConsumerStatefulWidget {
  const OtherAudioScreen({super.key});

  @override
  ConsumerState<OtherAudioScreen> createState() => _OtherAudioScreenState();
}

class _OtherAudioScreenState extends ConsumerState<OtherAudioScreen> {
  bool isLoading = true;
  Map<String, String> get categories =>
      ref.watch(localDataSourceProvider).getAudioCategories();

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
          );
  }
}
