import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sabha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    HadethTab(),
    QuranTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/defult_background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: Text('اسلامي'),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:
                currentIndex, // دي معناها ان الايكون اللي هيكون عليها هي اول واحده مالشمال
            onTap: (Index) {
              currentIndex = Index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/radio.png"),
                  ),
                  label: "r"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha_blue.png")),
                  label: "s"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/hadith.png")),
                  label: "h"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "q")
            ],
          )),
    );
  }
}
