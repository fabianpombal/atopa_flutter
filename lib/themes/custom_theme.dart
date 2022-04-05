import 'package:flutter/material.dart';

class CustomTheme {
  static const Color atopaBlue = Color.fromRGBO(13, 96, 254, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: atopaBlue,
      appBarTheme: const AppBarTheme(
        color: atopaBlue,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: atopaBlue),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: atopaBlue),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: atopaBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: atopaBlue, shape: const StadiumBorder(), elevation: 0)),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: atopaBlue));
}
