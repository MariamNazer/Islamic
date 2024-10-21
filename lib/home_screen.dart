import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sabha/sebha_tab.dart';
import 'package:islamic/tabs/settings/settinge_tab.dart';
import 'package:islamic/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    SettingeTab()
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/${settingsProvider.backgroundImageName}.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:
                currentIndex, // دي معناها ان الايكون اللي هيكون عليها هي اول واحده مالشمال
            // ignore: non_constant_identifier_names
            onTap: (Index) {
              currentIndex = Index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/quran.png")),
                label: AppLocalizations.of(context)!.quran,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/hadith.png")),
                label: AppLocalizations.of(context)!.hadeth,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/images/sebha_blue.png")),
                label: AppLocalizations.of(context)!.sebaha,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/images/radio.png"),
                ),
                label: AppLocalizations.of(context)!.radio,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: AppLocalizations.of(context)!.settings,
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ],
          )),
    );
  }
}
