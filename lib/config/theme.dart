import 'package:flutter/material.dart';

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: Colors.blue,
  iconTheme: IconThemeData(color: Colors.black),
  titleTextStyle: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
); 

ThemeData themeData = ThemeData(
  appBarTheme: appBarTheme,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
);