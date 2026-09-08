import 'package:flutter/material.dart';
import 'package:varadvani/core/common/screen_arguments/sign_up_data.dart';
import 'package:varadvani/domain/entities/audio/audio_entity.dart';
import 'package:varadvani/domain/entities/audio/category_entity.dart';
import 'package:varadvani/domain/entities/audio/shravya_entity.dart';
import 'package:varadvani/presentation/screens/appa/appa_granth_sampada_screen.dart';
import 'package:varadvani/presentation/screens/appa/appa_jeevanpat_screen.dart';
import 'package:varadvani/presentation/screens/appa/charitra_saramruta_screen.dart';
import 'package:varadvani/presentation/screens/appa/charitra_screen.dart';
import 'package:varadvani/presentation/screens/appa/dada_appa_screen.dart';
import 'package:varadvani/presentation/screens/audio/audio_list_screen.dart';
import 'package:varadvani/presentation/screens/audio/player_screen.dart';
import 'package:varadvani/presentation/screens/audio/shravya_granth_screen.dart';
import 'package:varadvani/presentation/screens/auth/change_password_screen.dart';
import 'package:varadvani/presentation/screens/auth/profile_info_screen.dart';
import 'package:varadvani/presentation/screens/auth/sign_in_screen.dart';
import 'package:varadvani/presentation/screens/dada/dada_granth_sampada_screen.dart';
import 'package:varadvani/presentation/screens/dada/dada_jeevanpat_screen.dart';
import 'package:varadvani/presentation/screens/dada/gajanan_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/dada/guru_shishya_screen.dart';
import 'package:varadvani/presentation/screens/dada/kanhya_bhilla_screen.dart';
import 'package:varadvani/presentation/screens/dada/kavya_parichay_screen.dart';
import 'package:varadvani/presentation/screens/dada/poorvardha_screen.dart';
import 'package:varadvani/presentation/screens/dada/uttarardha_screen.dart';
import 'package:varadvani/presentation/screens/drawer/awards/anantshree_award_screen.dart';
import 'package:varadvani/presentation/screens/drawer/awards/shree_dasganu_award_screen.dart';
import 'package:varadvani/presentation/screens/drawer/book_availability_screen.dart';
import 'package:varadvani/presentation/screens/drawer/literary_works_screen.dart';
import 'package:varadvani/presentation/screens/drawer/photo_gallary_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/about_pratishthan_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/dhyan_mandir_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/dinkram_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/festivals_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/how_to_reach_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/other_departments_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/parampara_rakshan_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/sanjeevan_screen.dart';
import 'package:varadvani/presentation/screens/drawer/pratishthan/vishwasta_mandal_screen.dart';
import 'package:varadvani/presentation/screens/drawer/related_websites_screen.dart';
import 'package:varadvani/presentation/screens/drawer/videos_screen.dart';
import 'package:varadvani/presentation/screens/home/audios_screen.dart';
import 'package:varadvani/presentation/screens/home/dasganu_maharaj_screen.dart';
import 'package:varadvani/presentation/screens/drawer/exams_screen.dart';
import 'package:varadvani/presentation/screens/home/home_screen.dart';
import 'package:varadvani/presentation/screens/home/profile_screen.dart';
import 'package:varadvani/presentation/screens/home/varadanand_bharati_screen.dart';
import 'package:varadvani/presentation/main_screen.dart';
import 'package:varadvani/presentation/screens/other/objectives_screen.dart';
import 'package:varadvani/presentation/screens/auth/sign_up_screen.dart';

class AppRoutes {
  ///Home Screen
  static const String mainScreen = '/MainScreen';
  static const String homeScreen = '/HomeScreen';
  static const String dasganuScreen = '/DasganuScreen';
  static const String varadanandScreen = '/VaradanandScreen';
  static const String audiosScreen = '/AudiosScreen';
  static const String profileScreen = '/ProfileScreen';

  ///Appa
  static const String appaJeevanpatScreen = '/AppaJeevanpatScreen';
  static const String charitraScreen = '/CharitraScreen';
  static const String dadaAppaScreen = '/DadaAppaScreen';
  static const String charitraSaramrutaScreen = '/CharitraSaramrutaScreen';
  static const String appaGranthSampadaScreen = '/AppaGranthSampadaScreen';

  ///Dada
  static const String dadaJeevanpatScreen = '/DadaJeevanpatScreen';
  static const String poorvardhaScreen = '/PoorvardhaScreen';
  static const String kavyaParichayScreen = '/KavyaParichayScreen';
  static const String guruShishyaScreen = '/GuruShishyaScreen';
  static const String kanhyaBhillaScreen = '/KanhyaBhillaScreen';
  static const String uttarardhaScreen = '/UttarardhaScreen';
  static const String gajananMaharajScreen = '/GajananMaharajScreen';
  static const String dadaGranthSampadaScreen = '/DadaGranthSampadaScreen';

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

  ///Awards
  static const String anantshreeAwardScreen = '/AnantshreeAwardScreen';
  static const String shreeDasganuAwardScreen = '/ShreeDasganuAwardScreen';

  ///Drawer Screens
  static const String literaryWorksScreen = '/LiteraryWorksScreen';
  static const String bookAvailabilityScreen = '/BookAvailabilityScreen';
  static const String photoGallaryScreen = '/PhotoGallaryScreen';
  static const String videosScreen = '/VideosScreen';
  static const String relatedWebsitesScreen = '/RelatedWebsitesScreen';
  static const String examsScreen = '/ExamsScreen';

  ///Other Screens
  static const String objectivesScreen = '/ObjectivesScreen';

  ///Auth
  static const String signUpScreen = '/SignUpScreen';
  static const String profileInfoScreen = '/ProfileInfoScreen';
  static const String signInScreen = '/SignInScreen';
  static const String changePasswordScreen = '/ChangePasswordScreen';

  ///Audio
  static const String audioListScreen = '/AudioListScreen';
  static const String playerScreen = '/PlayerScreen';
  static const String shravyaGranthScreen = '/ShravyaGranthScreen';
  static const String granthListScreen = '/GranthListScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? argument = settings.arguments;

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
      case audiosScreen:
        return MaterialPageRoute(builder: (context) => AudiosScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

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
      case uttarardhaScreen:
        return MaterialPageRoute(builder: (context) => UttarardhaScreen());
      case gajananMaharajScreen:
        return MaterialPageRoute(builder: (context) => GajananMaharajScreen());
      case dadaGranthSampadaScreen:
        return MaterialPageRoute(
          builder: (context) => DadaGranthSampadaScreen(),
        );

      ///Appa
      case appaJeevanpatScreen:
        return MaterialPageRoute(builder: (context) => AppaJeevanpatScreen());
      case charitraScreen:
        return MaterialPageRoute(builder: (context) => CharitraScreen());
      case dadaAppaScreen:
        return MaterialPageRoute(builder: (context) => DadaAppaScreen());
      case charitraSaramrutaScreen:
        return MaterialPageRoute(
          builder: (context) => CharitraSaramrutaScreen(),
        );
      case appaGranthSampadaScreen:
        return MaterialPageRoute(
          builder: (context) => AppaGranthSampadaScreen(),
        );

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

      ///Awards
      case anantshreeAwardScreen:
        return MaterialPageRoute(builder: (context) => AnantshreeAwardScreen());
      case shreeDasganuAwardScreen:
        return MaterialPageRoute(
          builder: (context) => ShreeDasganuAwardScreen(),
        );

      ///Drawer Screens
      case literaryWorksScreen:
        return MaterialPageRoute(builder: (context) => LiteraryWorksScreen());
      case bookAvailabilityScreen:
        return MaterialPageRoute(
          builder: (context) => BookAvailabilityScreen(),
        );
      case photoGallaryScreen:
        return MaterialPageRoute(builder: (context) => PhotoGallaryScreen());
      case videosScreen:
        return MaterialPageRoute(builder: (context) => VideosScreen());
      case relatedWebsitesScreen:
        return MaterialPageRoute(builder: (context) => RelatedWebsitesScreen());
      case examsScreen:
        return MaterialPageRoute(builder: (context) => ExamsScreen());

      ///Auth
      case signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case profileInfoScreen:
        final data = argument == null
            ? SignUpData.empty()
            : argument as SignUpData;
        return MaterialPageRoute(
          builder: (context) => ProfileInfoScreen(signUpData: data),
        );
      case signInScreen:
        return MaterialPageRoute(builder: (context) => SignInScreen());
      case changePasswordScreen:
        return MaterialPageRoute(builder: (context) => ChangePasswordScreen());

      ///Audio
      case audioListScreen:
        final data = argument == null
            ? CategoryEntity.empty()
            : argument as CategoryEntity;
        return MaterialPageRoute(
          builder: (context) =>
              AudioListScreen(category: data.category, items: data.items),
        );
      case playerScreen:
        final data = argument == null
            ? AudioEntity.empty()
            : argument as AudioEntity;
        return MaterialPageRoute(
          builder: (context) => PlayerScreen(audio: data),
        );
      case shravyaGranthScreen:
        return MaterialPageRoute(builder: (context) => ShravyaGranthScreen());
      case granthListScreen:
        final data = argument == null
            ? ShravyaEntity.empty()
            : argument as ShravyaEntity;
        return MaterialPageRoute(
          builder: (context) =>
              AudioListScreen(category: data.granth, items: data.items),
        );

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
