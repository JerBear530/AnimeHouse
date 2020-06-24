
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Profile extends StatefulWidget{
  Profile ({Key key}) : super (key:key);

  @override
  _Profile createState()=>_Profile();

}

class _Profile extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Container EditButton;

    return  Scaffold(
        body: Text("Profile", style: TextStyle(fontSize: 30),)


    );
  }
}