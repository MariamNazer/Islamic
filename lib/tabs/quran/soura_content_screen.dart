import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/settings/settings_provider.dart';
import 'package:islamic/widgets/load_indicator.dart';
import 'package:provider/provider.dart';

class SouraContentScreen extends StatefulWidget {
  static const String routName = '/soura-content';

  const SouraContentScreen({super.key});

  @override
  State<SouraContentScreen> createState() => _SouraContentScreenState();
}

class _SouraContentScreenState extends State<SouraContentScreen> {
  List<String> ayat = [];

  late SouraContentArgs args;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    args = ModalRoute.of(context)!.settings.arguments as SouraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${settingsProvider.backgroundImageName}.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
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
            child: ayat.isEmpty
                ? const LoadIndicator()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount: ayat.length,
                  ),
          ),
        ));
  }

  void loadSuraFile() async {
    await Future.delayed(const Duration(seconds: 1));
    String soura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = soura.split('\r\n');
    setState(() {});
  }
}
