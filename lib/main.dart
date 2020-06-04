import 'package:flutter/material.dart';
import 'Login.dart';
import 'home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      "/login":(BuildContext context)=>Login(),
      "/home_page":(BuildContext context)=>HomePage()
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Login()

    );
  }
}

