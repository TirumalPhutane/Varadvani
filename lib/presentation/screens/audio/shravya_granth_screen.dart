import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/domain/entities/audio/shravya_entity.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/providers/audio/get_shravya_provider.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/presentation/widgets/mini_player_bar.dart';
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
      appBar: CustomAppBar(title: context.l10n.audio_books),
      body: Column(
        children: [
          Expanded(
            child:
                shravyaGranthState.isLoading || shravyaGranthState.data == null
                ? Center(child: WidgetHelper.buildLoader())
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: ListView.builder(
                      itemCount: shravyaGranthState.data!.data.length,
                      itemBuilder: (context, index) {
                        final granthData = shravyaGranthState.data!.data[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: buildCard(granthData),
                        );
                      },
                    ),
                  ),
          ),
          const MiniPlayerBar(),
        ],
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
          color: context.theme.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                granthData.subCategory,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Mukta',
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '• ${granthData.count} ${AppLocalizations.of(context)!.audio}',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Mukta_light',
                      color: context.colors.onSurface,
                      letterSpacing: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
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
                        padding: const EdgeInsets.symmetric(vertical: 5),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
