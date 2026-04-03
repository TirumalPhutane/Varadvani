import 'package:flutter/material.dart';
import 'package:varadvani/presentation/screens/appa/charitra_screen.dart';
import 'package:varadvani/presentation/screens/dada/dada_appa_screen.dart';
import 'package:varadvani/presentation/screens/dada/dada_jeevanpat_screen.dart';
import 'package:varadvani/presentation/screens/dada/gajanan_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/dada/guru_shishya_screen.dart';
import 'package:varadvani/presentation/screens/dada/kanhya_bhilla_screen.dart';
import 'package:varadvani/presentation/screens/dada/kavya_parichay_screen.dart';
import 'package:varadvani/presentation/screens/dada/poorvardha_screen.dart';
import 'package:varadvani/presentation/screens/dada/uttarardha_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/about_pratishthan_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/dhyan_mandir_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/dinkram_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/festivals_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/how_to_reach_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/other_departments_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/parampara_rakshan_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/sanjeevan_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/vishwasta_mandal_screen.dart';
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
  static const String dadaJeevanpatScreen = '/DadaJeevanpatScreen';
  static const String poorvardhaScreen = '/PoorvardhaScreen';
  static const String kavyaParichayScreen = '/KavyaParichayScreen';
  static const String guruShishyaScreen = '/GuruShishyaScreen';
  static const String kanhyaBhillaScreen = '/KanhyaBhillaScreen';
  static const String dadaAppaScreen = '/DadaAppaScreen';
  static const String uttarardhaScreen = '/UttarardhaScreen';
  static const String gajananMaharajScreen = '/GajananMaharajScreen';

  ///Pratishthan
  static const String aboutPratishthanScreen = '/AboutPratishthanScreen';
  static const String dinkramScreen = '/DinkramScreen';
  static const String festivalsScreen = '/FestivalsScreen';
  static const String sanjeevanScreen = '/SanjeevanScreen';
  static const String dhyanMandirScreen = '/DhyanMandirScreen';
  static const String vishwastaMandalScreen = '/VishwastaMandalScreen';
  static const String paramparaRakshanScreen = '/ParamparaRakshanScreen';
  static const String otherDepartmentsScreen = '/OtherDepartmentsScreen';
  static const String howToReachScreen = '/HowToReachScreen';

  ///Drawer Screens

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

      ///Pratishthan
      case aboutPratishthanScreen:
        return MaterialPageRoute(
          builder: (context) => AboutPratishthanScreen(),
        );
      case dinkramScreen:
        return MaterialPageRoute(builder: (context) => DinkramScreen());
      case festivalsScreen:
        return MaterialPageRoute(builder: (context) => FestivalsScreen());
      case sanjeevanScreen:
        return MaterialPageRoute(builder: (context) => SanjeevanScreen());
      case dhyanMandirScreen:
        return MaterialPageRoute(builder: (context) => DhyanMandirScreen());
      case vishwastaMandalScreen:
        return MaterialPageRoute(builder: (context) => VishwastaMandalScreen());
      case paramparaRakshanScreen:
        return MaterialPageRoute(
          builder: (context) => ParamparaRakshanScreen(),
        );
      case otherDepartmentsScreen:
        return MaterialPageRoute(
          builder: (context) => OtherDepartmentsScreen(),
        );
      case howToReachScreen:
        return MaterialPageRoute(builder: (context) => HowToReachScreen());

      ///Dada
      case dadaJeevanpatScreen:
        return MaterialPageRoute(builder: (context) => DadaJeevanpatScreen());
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
