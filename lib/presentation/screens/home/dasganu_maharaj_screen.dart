import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';

class DasganuMaharajScreen extends StatefulWidget {
  const DasganuMaharajScreen({super.key});

  @override
  State<DasganuMaharajScreen> createState() => _DasganuMaharajScreenState();
}

class _DasganuMaharajScreenState extends State<DasganuMaharajScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.p_dada,
        isFromHome: true,
        isShowLeading: true,
      ),
      body: Center(child: Text('Welcome to the Dasganu Maharaj Screen')),
    );
  }
}
