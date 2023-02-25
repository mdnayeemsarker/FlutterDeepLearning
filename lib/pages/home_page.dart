import 'package:flutter/material.dart';
import 'package:flutter_dl/widgets/deawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "MD. NAYEEM SARKER";
    int age = 24;
    int mobile = 01714466703;
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
      ),
      body: Center(
        child: Container(
          child: Text(
              "My name is: $name, age is: $age, \nAnd my mobile number is $mobile"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
