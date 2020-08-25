
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/bottom_navigation.dart';
import 'package:graphqltutorial/models/user.dart';
import 'package:graphqltutorial/screens/authenticate/register.dart';
import 'package:graphqltutorial/screens/authenticate/sign_in.dart';
import 'package:graphqltutorial/screens/wrapper.dart';
import 'package:graphqltutorial/services/auth.dart';
import 'package:graphqltutorial/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'splash.dart';
import 'screens/Login.dart';
import 'screens/anime_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final routes = <String, WidgetBuilder>{
      "/bottom_navigation":(BuildContext context)=>bottomNavigation(),
      "/login":(BuildContext context)=>Login(),
      "/home_page":(BuildContext context)=>HomePage(),
      "/anime_page":(BuildContext context)=> AnimePage(),
      "/sign_in":(BuildContext context)=> SignIn(),
      "/register":(BuildContext context)=>Register(),

      "/authenticate":(BuildContext context)=>Authenticate(),
    };

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: Wrapper(),
        // Splash(),

      ),
    );
  }
}