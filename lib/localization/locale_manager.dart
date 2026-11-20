import 'package:material_ui/material_ui.dart';
import 'package:varadvani/l10n/app_localizations.dart';

class LocaleManager extends ChangeNotifier {
  Locale locale = const Locale('mr');

  void changeLocale(Locale newLocale) {
    if (AppLocalizations.supportedLocales.contains(newLocale)) {
      locale = newLocale;
      notifyListeners();
    }
  }
}
