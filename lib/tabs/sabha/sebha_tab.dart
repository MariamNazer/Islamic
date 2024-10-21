import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:islamic/tabs/settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String sebhaText = 'سبحان الله';
  int change = 0;
  double angle = 0;
  void countAndRotate() {
    angle -= 2;
    counter += 1;
    if (change == 0) {
      if (counter % 33 == 0) {
        change = 1;
        sebhaText = 'الحمدلله';
      }
    } else if (change == 1) {
      if (counter % 33 == 0) {
        change = 2;
        sebhaText = 'الله أكبر';
      }
    } else if (change == 2) {
      if (counter % 33 == 0) {
        change = 0;
        sebhaText = 'سبحان الله';
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Column(
              children: [
                Transform.translate(
                  offset: const Offset(10, 4),
                  child: Image.asset(
                      settingsProvider.isDark
                          ? 'assets/images/darkheadofseb7a.png'
                          : 'assets/images/headofseb7a.png',
                      height: settingsProvider.isDark
                          ? height * 0.11
                          : height * 0.13),
                ),
                Transform.translate(
                  offset: Offset(0, -height * 0.089),
                  child: GestureDetector(
                    onTap: countAndRotate,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                          settingsProvider.isDark
                              ? 'assets/images/darkbodyofseb7a.png'
                              : 'assets/images/bodyofseb7a.png',
                          width: settingsProvider.isDark
                              ? width * 0.5
                              : width * 0.7,
                          height: settingsProvider.isDark
                              ? height * 0.4
                              : height * 0.4),
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
                offset: Offset(0, -height * 0.1),
                child: Text(
                  AppLocalizations.of(context)!.numberOfPraises,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: settingsProvider.isDark
                          ? AppTheme.white
                          : AppTheme.black),
                )),
            SizedBox(
              height: height * 0.04,
            ),
            Transform.translate(
              offset: Offset(0, -height * 0.1),
              child: Container(
                height: height * 0.1,
                width: width * 0.17,
                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: settingsProvider.isDark
                      ? AppTheme.darkPrimary
                      : Color(0XFFB7935F).withOpacity(0.57),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.028,
            ),
            Transform.translate(
              offset: Offset(0, -height * 0.1),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    color: settingsProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.lightPrimary,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(sebhaText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: settingsProvider.isDark
                          ? Color(0xFF0F1424)
                          : AppTheme.white,
                    )),
              ),
            )
          ])),
    );
  }
}
