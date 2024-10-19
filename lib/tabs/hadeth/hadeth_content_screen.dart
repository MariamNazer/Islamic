import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/hadeth/hadeth.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatefulWidget {
  static const String routName = '/hadeth_content';

  const HadethContentScreen({super.key});

  @override
  State<HadethContentScreen> createState() => _SouraContentScreenState();
}

class _SouraContentScreenState extends State<HadethContentScreen> {
  List<String> ahadeth = [];

  late SouraContentArgs args;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${settingsProvider.backgroundImageName}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(hadeth.title),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.08),
            padding:
                EdgeInsets.symmetric(vertical: height * 0.08, horizontal: 30),
            decoration: BoxDecoration(
                color: settingsProvider.isDark
                    ? AppTheme.darkPrimary
                    : AppTheme.white,
                borderRadius: BorderRadius.circular(25)),
            child: ListView.builder(
              itemBuilder: (_, index) => Text(
                hadeth.content[index],
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              itemCount: hadeth.content.length,
            ),
          ),
        ));
  }
}
