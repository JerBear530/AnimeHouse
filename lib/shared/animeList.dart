import 'package:flutter/cupertino.dart';
import '../models/PopularAnimeCollection.dart';
import 'package:flutter/material.dart';


List<Widget> filteredAnimeList(PopularAnimeCollection animes,double itemWidth,double itemHeight){

  List<Widget> animeWidgets = [];

  for (int i = 0; i<animes.data.length;i++){
    String animeTitle= paddingRight(animes.data[i].attributes.canonicalTitle);

    animeWidgets.add(
      Container(child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
              child: Image.network(animes.data[i].attributes.posterImage.small,
                fit: BoxFit.fill,),
            ),
            Flexible(fit: FlexFit.loose,
                child:Container(color:Color(0xffedf1f5),width:itemWidth,height:30,child: Text(animeTitle,
              style: TextStyle(fontSize: 10,color: Colors.black,),textAlign: TextAlign.center,)
            ))
          ],
        ),),

    );
  }
  return  animeWidgets;
}

List<Widget> allTimePopular(PopularAnimeCollection animes,double itemWidth){

  List<Widget> animeWidgets = [];

  for (int i = 0; i<6;i++){
    String animeTitle= paddingRight(animes.data[i].attributes.canonicalTitle);

    animeWidgets.add(
       Container(child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
              child: Image.network(animes.data[i].attributes.posterImage.small,
                fit: BoxFit.fill,),
            ),
            Container(color:Color(0xffedf1f5),width:itemWidth,height:30,child: Text(animeTitle,
              style: TextStyle(fontSize: 10,color: Colors.black,),textAlign: TextAlign.center,)
            )
          ],
        ),),

    );
  }
  return  animeWidgets;
}

String paddingRight(String animeName){

  if(animeName.length > 37){
    String newName;
    newName = animeName.substring(0,37)+"...";
    return newName;
  }

  return animeName;

}