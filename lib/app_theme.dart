import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0XFFB7935F);
  static Color darkPrimary = const Color(0XFF141A2E);
  static Color white = const Color(0XFFF8F8F8);
  static Color black = const Color(0XFF242424);
  static Color gold = const Color(0XFFFACC1D);
  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: black,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: black,
          )),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: lightPrimary,
        selectedItemColor: black,
        unselectedItemColor: white,
      ),
      textTheme: TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: black),
          headlineLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: black)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimary,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: white,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: white,
          )),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkPrimary,
        selectedItemColor: gold,
        unselectedItemColor: white,
      ),
      textTheme: TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: white),
          headlineLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: gold)));
}
