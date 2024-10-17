import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sabha/sebha_tab.dart';
import 'package:islamic/tabs/settings/settinge_tab.dart';

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
    const SettingeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/defult_background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('إسلامي'),
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
                label: "القرآن",
                backgroundColor: AppTheme.lightPrimary,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/hadith.png")),
                label: "الأحاديث",
                backgroundColor: AppTheme.lightPrimary,
              ),
              BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/images/sebha_blue.png")),
                label: "التسبيح",
                backgroundColor: AppTheme.lightPrimary,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/images/radio.png"),
                ),
                label: "الراديو",
                backgroundColor: AppTheme.lightPrimary,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: "الاعدادات",
                backgroundColor: AppTheme.lightPrimary,
              ),
            ],
          )),
    );
  }
}
