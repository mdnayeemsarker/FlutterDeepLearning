import 'package:flutter/material.dart';
import 'package:flutter_dl/pages/home_page.dart';
import 'package:flutter_dl/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.red),
        darkTheme: ThemeData(brightness: Brightness.dark
            // primarySwatch: Colors.blueGrey
            ),
        initialRoute: "/home",
        routes: {
          "/": (context) => LoginPage(),
          "/home": (context) => HomePage(),
        });
  }
}
