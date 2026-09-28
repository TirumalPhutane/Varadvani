import 'package:flutter/material.dart';
import 'package:varadvani/core/extensions/extension.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.exams),
      body: SafeArea(
        child: Center(
          child: Text(
            'हे वैशिष्ट्य लवकरच आपल्या भेटीला येत आहे.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mukta',
              color: context.colors.onSurface,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}
