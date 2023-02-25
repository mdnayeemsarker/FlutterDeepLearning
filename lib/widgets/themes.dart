import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
        // color: Colors.white,
        elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark
            // primarySwatch: Colors.blueGrey
      );
}
