import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.title,
        isFromHome: true,
        isShowLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            'भक्तीत अंतर तुझ्या कधीही नसावे | \nमागेपुढे आमुचिया विठू तू असावे ||',
            style: TextStyle(fontSize: 18, fontFamily: 'Mukta_medium'),
          ),
        ),
      ),
    );
  }
}
