import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/settings/language.dart';
import 'package:islamic/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingeTab extends StatelessWidget {
  List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'an', name: 'العربية')
  ];

  SettingeTab({super.key});
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w500)),
            Switch(
                value:
                    settingsProvider.themeMode == ThemeMode.dark ? true : false,
                onChanged: (isDark) => settingsProvider
                    .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: AppTheme.gold //بستخدمه عشان اغير لون السويتش

                )
          ]),
          const SizedBox(
            height: 8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w500)),
            DropdownButtonHideUnderline(
              child: DropdownButton<Language>(
                value: languages.firstWhere((language) =>
                    language.code == settingsProvider.languageCode),
                items: languages
                    .map((language) => DropdownMenuItem<Language>(
                        value: language,
                        child: Text(
                          language.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        )))
                    .toList(),
                onChanged: (selectedLanguage) {
                  if (selectedLanguage != null) {
                    settingsProvider.changeLanguage(selectedLanguage.code);
                  }
                },
                borderRadius: BorderRadius.circular(20),
                dropdownColor: settingsProvider.isDark
                    ? AppTheme.darkPrimary
                    : AppTheme.white,
              ),
            )
          ])
        ],
      ),
    );
  }
}
