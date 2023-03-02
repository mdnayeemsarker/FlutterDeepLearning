import 'package:flutter/material.dart';
import 'package:flutter_dl/pages/cart_page.dart';
import 'package:flutter_dl/pages/home_page.dart';
import 'package:flutter_dl/pages/login_page.dart';
import 'package:flutter_dl/utils/routes.dart';
import 'package:flutter_dl/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.cartRoute: (context) => CratPage(),
        });
  }
}
