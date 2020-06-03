import 'package:flutter/cupertino.dart';
import 'PopularAnimeCollection.dart';
import 'package:flutter/material.dart';


List<Widget> filteredAnimeList(PopularAnimeCollection animes,itemWidth){

  List<Widget> animeWidgets = [];

  for (int i = 0; i<animes.data.length;i++){

    animeWidgets.add(
      Container(child: Column(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
            child: Image.network(animes.data[i].attributes.posterImage.small,
              fit: BoxFit.fill,),
          ),
          Container(color:Color(0xffedf1f5),width:itemWidth,height:30,child: Text(animes.data[i].attributes.canonicalTitle,
            style: TextStyle(fontSize: 10,color: Colors.black,),textAlign: TextAlign.center,)
          )
        ],
      ),),
    );
  }
  return  animeWidgets;
}

List<Widget> allTimePopular(PopularAnimeCollection animes,double itemWidth){

  List<Widget> animeWidgets = [];

  for (int i = 0; i<6;i++){

    animeWidgets.add(
      Container(child: Column(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
            child: Image.network(animes.data[i].attributes.posterImage.small,
              fit: BoxFit.fill,),
          ),
          Container(color:Color(0xffedf1f5),width:itemWidth,height:30,child: Text(animes.data[i].attributes.canonicalTitle,
            style: TextStyle(fontSize: 10,color: Colors.black,),textAlign: TextAlign.center,)
          )
        ],
      ),),
    );
  }
  return  animeWidgets;
}