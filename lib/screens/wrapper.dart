import 'package:flutter/material.dart';
import 'package:graphqltutorial/bottom_navigation.dart';
import 'package:graphqltutorial/models/user.dart';
import 'package:graphqltutorial/screens/authenticate/authenticate.dart';
import 'package:graphqltutorial/screens/authenticate/register.dart';
import 'package:provider/provider.dart';
import '../home_page.dart';


class Wrapper extends StatelessWidget{

  initMethod(context) async {


  }

  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return either Home Page or authenticate widget
    if (user ==null){


      return Authenticate();
    } else{

      return bottomNavigation();
    }






  }
}