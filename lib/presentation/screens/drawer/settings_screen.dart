import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSettingsOption(
              context,
              'assets/svg/theme.svg',
              'Theme',
              AppRoutes.changeThemeScreen,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
    BuildContext context,
    String svg,
    String title,
    String routeName,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(
                  svg,
                  colorFilter: ColorFilter.mode(
                    context.colors.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Mukta',
                    color: context.colors.onSurface,
                    letterSpacing: 0,
                  ),
                ),
              ],
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
    );
  }
}
