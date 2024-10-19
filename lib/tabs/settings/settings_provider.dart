import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';
  String get backgroundImageName =>
      isDark ? 'dark_background' : 'defult_background';
  bool get isDark => themeMode == ThemeMode.dark;
  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    notifyListeners();
  }
}
