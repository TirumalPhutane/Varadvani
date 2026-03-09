import 'package:flutter/material.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/presentation/widgets/custom_app_bar.dart';

class VaradanandBharatiScreen extends StatefulWidget {
  const VaradanandBharatiScreen({super.key});

  @override
  State<VaradanandBharatiScreen> createState() =>
      _VaradanandBharatiScreenState();
}

class _VaradanandBharatiScreenState extends State<VaradanandBharatiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.p_appa,
        isFromHome: true,
        isShowLeading: true,
      ),
      body: Center(child: Text('Welcome to the Varadanand Bharati Screen')),
    );
  }
}
