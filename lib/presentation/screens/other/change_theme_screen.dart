import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/theme/theme_provider.dart';

class ChangeThemeScreen extends ConsumerWidget {
  const ChangeThemeScreen({super.key});

  static const _options = [
    (mode: ThemeMode.system, label: 'System Default'),
    (mode: ThemeMode.light, label: 'Light'),
    (mode: ThemeMode.dark, label: 'Dark'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'Theme'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          spacing: 15,
          children: [
            for (final option in _options)
              _ThemeOptionTile(
                title: option.label,
                isSelected: selectedMode == option.mode,
                onTap: () =>
                    ref.read(themeModeProvider.notifier).setTheme(option.mode),
              ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  const _ThemeOptionTile({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Mukta',
                color: context.colors.onSurface,
                letterSpacing: 0,
              ),
            ),
            // If you have separate filled/outline radio SVGs, swap the asset
            // path instead of relying only on colorFilter:
            //
            SvgPicture.asset(
              isSelected
                  ? 'assets/svg/radio_filled.svg'
                  : 'assets/svg/radio.svg',
              colorFilter: ColorFilter.mode(
                context.colors.primary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
