import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme() {
  return ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xffCC7D00)),
        overline: TextStyle(
            fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            fontFamily: "Poppins"),
      ),
      fontFamily: "Poppins",
      scaffoldBackgroundColor: HexColor('333739'),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          backgroundColor: HexColor('333739')),
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: HexColor('333739'))));
}

ThemeData lightTheme() {
  return ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xffCC7D00)),
        overline: TextStyle(
            fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
        bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            fontFamily: "Poppins"),
      ),
      fontFamily: "Poppins",
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          )));
}
