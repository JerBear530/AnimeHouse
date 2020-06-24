import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:graphqltutorial/search.dart';
import 'library.dart';
import 'search.dart';
import 'profile_page.dart';

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
    Profile()


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
              BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.redAccent,),
                  title: Text("Home",style: TextStyle(color: Colors.redAccent))),

              BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.redAccent),
                  title: Text("Search",style: TextStyle(color: Colors.redAccent))),

              BottomNavigationBarItem(icon: Icon(Icons.library_add,color: Colors.redAccent),
                  title: Text("Library",style: TextStyle(color: Colors.redAccent))),

              BottomNavigationBarItem(icon: Icon(Icons.face,color: Colors.redAccent),
                  title: Text("Profile",style: TextStyle(color: Colors.redAccent),)),
            ]
        )


    );

  }
}