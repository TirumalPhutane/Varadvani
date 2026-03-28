import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_mr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('mr')
  ];

  /// The title of the app
  ///
  /// In en, this message translates to:
  /// **'Varadvani'**
  String get title;

  /// Home screen label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// P. Dada screen label
  ///
  /// In en, this message translates to:
  /// **'P. Dada'**
  String get p_dada;

  /// P. Appa screen label
  ///
  /// In en, this message translates to:
  /// **'P. Appa'**
  String get p_appa;

  /// Exams screen label
  ///
  /// In en, this message translates to:
  /// **'Exams'**
  String get exams;

  /// Profile screen label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Foundation label
  ///
  /// In en, this message translates to:
  /// **'Foundation'**
  String get foundation;

  /// Literary Works label
  ///
  /// In en, this message translates to:
  /// **'Literary Works'**
  String get literary_works;

  /// Book Availability label
  ///
  /// In en, this message translates to:
  /// **'Book Availability'**
  String get book_availability;

  /// Photo Gallery label
  ///
  /// In en, this message translates to:
  /// **'Photo Gallery'**
  String get photo_gallery;

  /// Audio & Video label
  ///
  /// In en, this message translates to:
  /// **'Audio & Video'**
  String get audio_video;

  /// Related Websites label
  ///
  /// In en, this message translates to:
  /// **'Related Websites'**
  String get related_websites;

  /// Settings label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// About the Foundation label
  ///
  /// In en, this message translates to:
  /// **'About the Foundation'**
  String get about_foundation;

  /// Daily Schedule label
  ///
  /// In en, this message translates to:
  /// **'Daily Schedule'**
  String get daily_schedule;

  /// Festivals label
  ///
  /// In en, this message translates to:
  /// **'Festivals'**
  String get festivals;

  /// Sanjivan label
  ///
  /// In en, this message translates to:
  /// **'Sanjivan'**
  String get sanjivan;

  /// Meditation Hall label
  ///
  /// In en, this message translates to:
  /// **'Meditation Hall'**
  String get meditation_hall;

  /// Board of Trustees label
  ///
  /// In en, this message translates to:
  /// **'Board of Trustees'**
  String get board_of_trustees;

  /// Heritage Preservation label
  ///
  /// In en, this message translates to:
  /// **'Heritage Preservation'**
  String get heritage_preservation;

  /// Other Departments label
  ///
  /// In en, this message translates to:
  /// **'Other Departments'**
  String get other_departments;

  /// How to Reach label
  ///
  /// In en, this message translates to:
  /// **'How to Reach'**
  String get how_to_reach;

  /// Dasganu Maharaj pratishthan label
  ///
  /// In en, this message translates to:
  /// **'Shri Dasganu\nMaharaj\nFoundation'**
  String get dasganu_pratishthan;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'mr': return AppLocalizationsMr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
