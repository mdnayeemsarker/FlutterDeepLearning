import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      cardColor: Colors.white,
      canvasColor: canvasColor,
      primarySwatch: Colors.red,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
          // elevation: 0.0,
          ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: darkCardColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey,
      ),
      canvasColor: darkCanvasColor,
      primarySwatch: Colors.grey,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
          // elevation: 0.0,
          ));
  static Color creamColor = Color.fromARGB(0, 173, 158, 158);
  static Color ligthCreamColor = Color.fromARGB(0, 173, 160, 160);
  static Color cardColor = Color.fromARGB(255, 199, 204, 216);
  static Color darkCardColor = Color.fromARGB(255, 95, 100, 107);
  static Color canvasColor = Color.fromARGB(255, 132, 136, 145);
  static Color darkCanvasColor = Color.fromARGB(255, 146, 147, 149);
  static Color accentColor = Color.fromARGB(255, 34, 68, 148);
  static Color textColor = Vx.gray600;
}
