

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class myLibrary extends StatefulWidget{
  myLibrary ({Key key}) : super (key:key);

  @override
  _myLibrary createState()=>_myLibrary();

}

class _myLibrary extends State<myLibrary>{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Text("Library", style: TextStyle(fontSize: 30),)


    );
  }
}