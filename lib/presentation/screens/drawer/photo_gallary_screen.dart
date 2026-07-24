import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';
import 'package:varadvani/theme/color_code.dart';

class PhotoGallaryScreen extends StatelessWidget {
  const PhotoGallaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.photo_gallery),
      body: SafeArea(
        child: Center(
          child: Text(
            'हे वैशिष्ट्य लवकरच आपल्या भेटीला येत आहे.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mukta',
              color: Color(ColorCode.black),
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}
