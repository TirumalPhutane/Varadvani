import 'package:flutter/material.dart';
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

  ///Other Screens
  static const String objectivesScreen = '/ObjectivesScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final Object? argument = settings.arguments;

    switch (settings.name) {
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
      case objectivesScreen:
        return MaterialPageRoute(builder: (context) => ObjectivesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
