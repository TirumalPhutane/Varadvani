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

  /// Sanjeevan label
  ///
  /// In en, this message translates to:
  /// **'Sanjeevan'**
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
  /// **'How to Reach?'**
  String get how_to_reach;

  /// Dasganu Maharaj pratishthan label
  ///
  /// In en, this message translates to:
  /// **'Shri Dasganu\nMaharaj\nFoundation'**
  String get dasganu_pratishthan;

  /// Mobile Number label
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// Mobile Number hint
  ///
  /// In en, this message translates to:
  /// **'Ex. 8392239075'**
  String get mobile_number_hint;

  /// Registration label
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// Message for sign up
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number and password to register.'**
  String get sign_up_message;

  /// Password label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Proceed label
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// Message for sign in to existing account
  ///
  /// In en, this message translates to:
  /// **'Sign in to your existing account'**
  String get existing_sign_in;

  /// Validation message for empty mobile no
  ///
  /// In en, this message translates to:
  /// **'Please enter mobile number'**
  String get empty_mobile;

  /// Validation message for wrong mobile no
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid mobile number'**
  String get mobile_validation;

  /// Validation message for empty password
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get empty_password;

  /// Validation message for password
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get password_validation;

  /// Profile Information label
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profile_info;

  /// Personal label
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// Name label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Email label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Address label
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Floor/Building/Apartment label
  ///
  /// In en, this message translates to:
  /// **'Floor/Building/Apartment'**
  String get floor_building;

  /// Street/Landmark label
  ///
  /// In en, this message translates to:
  /// **'Street/Landmark'**
  String get street_landmark;

  /// City label
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// State label
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// Country label
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Pincode label
  ///
  /// In en, this message translates to:
  /// **'Pincode'**
  String get pincode;

  /// Register label
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Validation message for empty mobile no
  ///
  /// In en, this message translates to:
  /// **'All fields are mandatory.'**
  String get all_are_mandatory;

  /// Validation message for email
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get email_validation;

  /// Validation message for name
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 7 characters long'**
  String get name_validation;

  /// Validation message for address
  ///
  /// In en, this message translates to:
  /// **'Address must be at least 5 characters long'**
  String get address_validation;

  /// Sign in label
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// Message for sign in
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number and password to sign in.'**
  String get sign_in_message;

  /// Sign in label
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get do_sign_in;

  /// Create Account label
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// Forgot Password label
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// Name hint
  ///
  /// In en, this message translates to:
  /// **'Ex. Varad Vani'**
  String get name_hint;

  /// Email hint
  ///
  /// In en, this message translates to:
  /// **'Ex. abc@gmail.com'**
  String get email_hint;

  /// Floor/Building/Apartment hint
  ///
  /// In en, this message translates to:
  /// **'Ex. Chintamani Apartment'**
  String get floor_apartment_hint;

  /// Street/Landmark hint
  ///
  /// In en, this message translates to:
  /// **'Ex. Chintamani Nagar'**
  String get street_landmark_hint;

  /// City hint
  ///
  /// In en, this message translates to:
  /// **'Ex. Pune'**
  String get city_hint;

  /// State hint
  ///
  /// In en, this message translates to:
  /// **'Ex. Maharashtra'**
  String get state_hint;

  /// Country hint
  ///
  /// In en, this message translates to:
  /// **'Ex. India'**
  String get country_hint;

  /// Pincode hint
  ///
  /// In en, this message translates to:
  /// **'Ex. 431401'**
  String get pincode_hint;

  /// Registering label
  ///
  /// In en, this message translates to:
  /// **'Registering...'**
  String get registering;

  /// Signing in label
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get signing_in;

  /// Loading profile label
  ///
  /// In en, this message translates to:
  /// **'Loading profile...'**
  String get loading_profile;

  /// Updating profile label
  ///
  /// In en, this message translates to:
  /// **'Updating profile...'**
  String get updating_profile;

  /// Logging out label
  ///
  /// In en, this message translates to:
  /// **'Logging out...'**
  String get logging_out;

  /// Deleting account label
  ///
  /// In en, this message translates to:
  /// **'Deleting account...'**
  String get deleting_account;

  /// Profile Details label
  ///
  /// In en, this message translates to:
  /// **'Profile Details'**
  String get profile_details;

  /// Cancel label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Personal Id label
  ///
  /// In en, this message translates to:
  /// **'Personal Id'**
  String get personal_id;

  /// Family Id label
  ///
  /// In en, this message translates to:
  /// **'Family Id'**
  String get family_id;

  /// Update label
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Logout label
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// Delete label
  ///
  /// In en, this message translates to:
  /// **'Yes, Delete'**
  String get delete;

  /// Delete Account label
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// Logout dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logout_message;

  /// Delete account dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete account permanently?'**
  String get delete_account_message;

  /// Confirm Password label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// Change Password label
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// Updating label
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get updating;

  /// Awards label
  ///
  /// In en, this message translates to:
  /// **'Awards'**
  String get awards;

  /// Shree Dasganu Award label
  ///
  /// In en, this message translates to:
  /// **'Shree Dasganu Award'**
  String get dasganu_award;

  /// Anantshree Award label
  ///
  /// In en, this message translates to:
  /// **'Anantshree Award'**
  String get anantshri_award;

  /// No label
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Yes label
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;
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
