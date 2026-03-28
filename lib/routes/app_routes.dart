import 'package:flutter/material.dart';
import 'package:varadvani/presentation/screens/appa/charitra_screen.dart';
import 'package:varadvani/presentation/screens/dada/dada_appa_screen.dart';
import 'package:varadvani/presentation/screens/dada/gajanan_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/dada/guru_shishya_screen.dart';
import 'package:varadvani/presentation/screens/dada/kanhya_bhilla_screen.dart';
import 'package:varadvani/presentation/screens/dada/kavya_parichay_screen.dart';
import 'package:varadvani/presentation/screens/dada/poorvardha_screen.dart';
import 'package:varadvani/presentation/screens/dada/uttarardha_screen.dart';
import 'package:varadvani/presentation/screens/home/dasganu_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/home/exams_screen.dart';
import 'package:varadvani/presentation/screens/home/home_screen.dart';
import 'package:varadvani/presentation/screens/home/profile_screen.dart';
import 'package:varadvani/presentation/screens/home/varadanand_bharati_screen.dart';
import 'package:varadvani/presentation/main_screen.dart';
import 'package:varadvani/presentation/screens/other/objectives_screen.dart';

class AppRoutes {
  ///Home Screen
  static const String mainScreen = '/MainScreen';
  static const String homeScreen = '/HomeScreen';
  static const String dasganuScreen = '/DasganuScreen';
  static const String varadanandScreen = '/VaradanandScreen';
  static const String examsScreen = '/ExamsScreen';
  static const String profileScreen = '/ProfileScreen';

  ///Appa
  static const String charitraScreen = '/CharitraScreen';

  ///Dada
  static const String poorvardhaScreen = '/PoorvardhaScreen';
  static const String kavyaParichayScreen = '/KavyaParichayScreen';
  static const String guruShishyaScreen = '/GuruShishyaScreen';
  static const String kanhyaBhillaScreen = '/KanhyaBhillaScreen';
  static const String dadaAppaScreen = '/DadaAppaScreen';
  static const String uttarardhaScreen = '/UttarardhaScreen';
  static const String gajananMaharajScreen = '/GajananMaharajScreen';

  ///Other Screens
  static const String objectivesScreen = '/ObjectivesScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final Object? argument = settings.arguments;

    switch (settings.name) {
      ///Home Screen
      case mainScreen:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case dasganuScreen:
        return MaterialPageRoute(builder: (context) => DasganuMaharajScreen());
      case varadanandScreen:
        return MaterialPageRoute(
          builder: (context) => VaradanandBharatiScreen(),
        );
      case examsScreen:
        return MaterialPageRoute(builder: (context) => ExamsScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      ///Other Screens
      case objectivesScreen:
        return MaterialPageRoute(builder: (context) => ObjectivesScreen());

      ///Dada
      case poorvardhaScreen:
        return MaterialPageRoute(builder: (context) => PoorvardhaScreen());
      case kavyaParichayScreen:
        return MaterialPageRoute(builder: (context) => KavyaParichayScreen());
      case guruShishyaScreen:
        return MaterialPageRoute(builder: (context) => GuruShishyaScreen());
      case kanhyaBhillaScreen:
        return MaterialPageRoute(builder: (context) => KanhyaBhillaScreen());
      case dadaAppaScreen:
        return MaterialPageRoute(builder: (context) => DadaAppaScreen());
      case uttarardhaScreen:
        return MaterialPageRoute(builder: (context) => UttarardhaScreen());
      case gajananMaharajScreen:
        return MaterialPageRoute(builder: (context) => GajananMaharajScreen());

      ///Appa
      case charitraScreen:
        return MaterialPageRoute(builder: (context) => CharitraScreen());

      ///Default
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
