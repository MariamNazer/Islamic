import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic/tabs/quran/soura_content_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (context) => const HomeScreen(),
        SouraContentScreen.routName: (context) => const SouraContentScreen(),
        HadethContentScreen.routName: (context) => const HadethContentScreen(),
      },
      initialRoute: HomeScreen.routename,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
