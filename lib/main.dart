
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/bottom_navigation.dart';
import 'home_page.dart';
import 'splash.dart';
import 'Login.dart';
import 'anime_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final routes = <String, WidgetBuilder>{
      "/bottom_navigation":(BuildContext context)=>bottomNavigation(),
      "/login":(BuildContext context)=>Login(),
      "/home_page":(BuildContext context)=>HomePage(),
      "/anime_page":(BuildContext context)=> AnimePage()
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Splash(),

    );
  }
}