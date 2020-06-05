import 'package:flutter/material.dart';



class search extends StatefulWidget{
  search ({Key key}) : super (key:key);

  @override
  _search createState()=>_search();

}

class _search extends State<search>{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Text("Search", style: TextStyle(fontSize: 30),)


    );
  }
}