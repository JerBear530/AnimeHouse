    import 'package:flutter/material.dart';
    import 'package:graphqltutorial/CoverImage.dart';






      const textInputDecoration = InputDecoration(

          fillColor: Colors.white,
          filled: true,
          enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0)),
          focusedBorder:OutlineInputBorder(borderSide: BorderSide(color:  Color(0xFFD0021B),width: 2.0))
      );

      const CoverImageContainer = BoxDecoration(
        color: Color(0xffEDF1F5),
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(100),
          bottomRight: const Radius.circular(100),
        ),

      );

      const PosterImageContainer = BoxDecoration(
        color: Color(0xffEDF1F5),
        borderRadius: BorderRadius.all(const Radius.circular(50))
        );

      const InfoUnderTitle = BoxDecoration(
          color: Color(0xffEDF1F5),
          borderRadius: BorderRadius.all(const Radius.circular(20)),
      );

      Stack ratingCircle = Stack(
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle),)

        ],

      );



