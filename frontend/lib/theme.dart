import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(primary: Colors.green.shade900),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.green[900],
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey)),
        fillColor: Colors.white,
        filled: true,
      ));
}
