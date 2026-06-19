import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:varadvani/core/constants/app_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/localization/locale_manager.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/theme/theme.dart';

//final ThemeManager themeManager = ThemeManager();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final LocaleManager localeManager = LocaleManager();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstants.authBox);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
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
    final storageService = ref.read(storageServiceProvider);
    final token = storageService.getAccessToken();
    final isLoggedIn = token != null && token.toString().isNotEmpty;

    if (isLoggedIn) ref.read(dioClientProvider).setAuthToken(token);

    final initialRoute = isLoggedIn
        ? AppRoutes.mainScreen
        : AppRoutes.signInScreen;

    return MaterialApp(
      title: 'Varadvani',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      locale: localeManager.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: initialRoute,
      navigatorKey: navigatorKey,
      //home: const MyHomePage(title: 'Varadvani'),
    );
  }
}
