import 'package:flutter/material.dart';
import 'package:flutter_dl/pages/home_page.dart';
import 'package:flutter_dl/pages/login_page.dart';
import 'package:flutter_dl/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        // debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(brightness: Brightness.dark
            // primarySwatch: Colors.blueGrey
            ),
        initialRoute: "/",
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
        });
  }
}
