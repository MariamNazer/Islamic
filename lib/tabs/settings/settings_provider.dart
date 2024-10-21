import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';
  String get backgroundImageName =>
      isDark ? 'dark_background' : 'defult_background';
  bool get isDark => themeMode == ThemeMode.dark;
  Future<void> _loadSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    languageCode = sharedPreferences.getString('language') ?? 'en';
    String? savedTheme = sharedPreferences.getString('mode');
    themeMode = (savedTheme == 'dark') ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  SettingsProvider() {
    _loadSettings();
  }
  Future<void> changeTheme(ThemeMode selectedTheme) async {
    themeMode = selectedTheme;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        'mode', selectedTheme == ThemeMode.dark ? 'dark' : 'light');

    notifyListeners();
  }

  Future<void> changeLanguage(String selectedLanguage) async {
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('language', selectedLanguage);
    notifyListeners();
  }
}
