import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.14,
        ),
        Image.asset('assets/images/radio_logo.png'),
        SizedBox(
          height: height * 0.06,
        ),
        Text(
          AppLocalizations.of(context)!.quranRadio,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: settingsProvider.isDark ? AppTheme.white : AppTheme.black),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: settingsProvider.languageCode == 1
              ? TextDirection.ltr
              : TextDirection.rtl,
          children: [
            Icon(Icons.skip_next,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
                size: width * 0.1),
            Icon(Icons.play_arrow,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
                size: width * 0.16),
            Icon(Icons.skip_previous,
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : AppTheme.lightPrimary,
                size: width * 0.1),
          ],
        )
      ],
    );
  }
}
