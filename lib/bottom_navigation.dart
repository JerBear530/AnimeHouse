import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:graphqltutorial/search.dart';
import 'library.dart';
import 'search.dart';

class bottomNavigation extends StatefulWidget{
  bottomNavigation({Key key}) : super (key:key);

  @override
  _bottomNavigation createState()=>_bottomNavigation();

}

class _bottomNavigation extends State<bottomNavigation>{
  int _selectedPage =0;
  final _pageOptions=[
    HomePage(),
    search(),
    myLibrary(),


  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(

            currentIndex: _selectedPage,
            onTap: (int index){
              setState(() {
                _selectedPage=index;
              });
            },

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home),
                  title: Text("Home")),

              BottomNavigationBarItem(icon: Icon(Icons.search),
                  title: Text("Search")),

              BottomNavigationBarItem(icon: Icon(Icons.library_add),
                  title: Text("Library")),
            ]
        )


    );

  }
}