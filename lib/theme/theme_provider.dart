import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/service/storage_service.dart';

/// Riverpod Notifier for managing theme mode (system / light / dark)
class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    // Read is synchronous once the settingsBox is already open at app start
    // (see note below on opening the box before runApp).
    final storage = ref.read(storageServiceProvider);
    return _stringToThemeMode(storage.getThemeMode());
  }

  ThemeMode _stringToThemeMode(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  /// Explicitly set the theme mode (system, light, or dark) and persist it.
  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    await ref
        .read(storageServiceProvider)
        .saveThemeMode(_themeModeToString(mode));
  }

  /// Cycles system -> light -> dark -> system.
  Future<void> cycleTheme() async {
    switch (state) {
      case ThemeMode.system:
        await setTheme(ThemeMode.light);
        break;
      case ThemeMode.light:
        await setTheme(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        await setTheme(ThemeMode.system);
        break;
    }
  }

  /// Simple two-way toggle (light <-> dark). If currently on "system",
  /// resolves against the platform's current brightness first.
  Future<void> toggleTheme() async {
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final currentlyDark = resolveIsDark(platformBrightness);
    await setTheme(currentlyDark ? ThemeMode.light : ThemeMode.dark);
  }

  /// Resolves the *effective* dark/light state, accounting for system mode.
  /// Useful outside MaterialApp (e.g. native status bar styling).
  bool resolveIsDark(Brightness platformBrightness) {
    switch (state) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return platformBrightness == Brightness.dark;
    }
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);
