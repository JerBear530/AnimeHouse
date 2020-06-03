
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'splash.dart';
import 'Login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final routes = <String, WidgetBuilder>{
      "/login":(BuildContext context)=>Login(),
      "/home_page":(BuildContext context)=>HomePage()
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Splash(),

    );
  }
}