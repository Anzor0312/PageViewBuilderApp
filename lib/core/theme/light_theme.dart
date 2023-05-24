import 'package:flutter/material.dart';

class TestTheme {
  static ThemeData lightMode = ThemeData(
  appBarTheme:const AppBarTheme(
    backgroundColor: Colors.blue,
    elevation: 0,
    titleTextStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)
  )
  );
   static ThemeData darkMode = ThemeData(
  appBarTheme:const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)
  )
  );
}
