import 'package:material_ui/material_ui.dart';
import 'package:varadvani/l10n/app_localizations.dart';

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension DropCapSplit on String {
  (String, String) splitFirstGrapheme() {
    final t = trimLeft();
    if (t.isEmpty) return ('', '');
    final chars = t.characters;
    return (chars.first, chars.skip(1).toString());
  }
}
