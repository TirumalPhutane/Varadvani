import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/localization/locale_manager.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/theme/theme.dart';

//final ThemeManager themeManager = ThemeManager();
final LocaleManager localeManager = LocaleManager();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    localeManager.addListener(localeListener);
    super.initState();
  }

  void localeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Varadvani',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        locale: localeManager.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.signUpScreen,
        //home: const MyHomePage(title: 'Varadvani'),
      ),
    );
  }
}
