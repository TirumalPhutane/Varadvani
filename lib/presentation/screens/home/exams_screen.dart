import 'package:flutter/material.dart';
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
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.exams,
        isFromHome: true,
        isShowLeading: true,
      ),
      body: Center(child: Text('Welcome to the Exams Screen')),
    );
  }
}
