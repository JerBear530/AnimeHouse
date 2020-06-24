
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Anime.dart';

class AnimePage extends StatelessWidget {

  final Anime anime;

  const AnimePage({Key key, @required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    Container followingButton;

    return Scaffold(
      body: Text(anime.attributes.canonicalTitle, style: TextStyle(fontSize: 20),),


    );
  }

}