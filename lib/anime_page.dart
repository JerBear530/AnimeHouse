
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/CoverImage.dart';
import 'Anime.dart';
import 'package:graphqltutorial/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimePage extends StatelessWidget {

  final Anime anime;

  const AnimePage({Key key, @required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WidthOfScreen = MediaQuery.of(context).size.width;
    final HeightOfScreen =  MediaQuery.of(context).size.height;
    final CoverImageConatinerHeight = MediaQuery.of(context).size.height/4;
    final CoverImageContainerWidth = MediaQuery.of(context).size.width;
    final PosterImageContainerPositionLeft =  (MediaQuery.of(context).size.width/2)-((MediaQuery.of(context).size.width/3)/2);
    final PosterImageContainerHeight = MediaQuery.of(context).size.height/4;
    final PosterImageContainerWidth = MediaQuery.of(context).size.width/3;




    return Scaffold(
      backgroundColor: Color(0xff6C7476),

        body:


        Column(children: <Widget>[

          Stack(children: <Widget>[

            //CoverImage of Anime
            Container(
                height: CoverImageConatinerHeight,
                width: CoverImageContainerWidth,
                decoration: CoverImageContainer.copyWith(
                    image:DecorationImage( image:  coverImage(), fit: BoxFit.cover,colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop)),
                    border: Border.all(color: Color(0xffD0021B), width: 2.0,),
                    boxShadow: [
                      BoxShadow( color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),

                      )])
            ),

            //PosterImage of Anime
            Positioned(left: PosterImageContainerPositionLeft, bottom:-(CoverImageConatinerHeight/3),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                      child: Container(
                          height:PosterImageContainerHeight,
                          width:PosterImageContainerWidth,
                          decoration:PosterImageContainer.copyWith(
                              image: DecorationImage(image: NetworkImage(anime.attributes.posterImage.small),fit:BoxFit.contain,),
                              border: Border.all(color: Color(0xffD0021B), width: 2.0,))
                      )
                  ),
                ),
              ))

          ], overflow: Overflow.visible),

           //Title Of Anime
           Padding(
             padding: const EdgeInsets.fromLTRB(0,55,0,0),
             child: Container(width:MediaQuery.of(context).size.width,margin: EdgeInsets.all(15),child: Center(child:
             Text(anime.attributes.canonicalTitle, style: GoogleFonts.anton(textStyle: TextStyle(color: Colors.white,fontSize: 20,)),textAlign: TextAlign.center, ))),
           ),

          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(2,2,2,2),
              child: Container(padding:EdgeInsets.all(5),child:

                Text(anime.attributes.showType+"-"+anime.attributes.ageRating,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                ),
                  decoration: InfoUnderTitle.copyWith(
                    border: Border.all(color:Color(0xffD0021B),width: 2.0)
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(padding:EdgeInsets.all(5),child:

              Text("Status: "+anime.attributes.status,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
              ),
                decoration: InfoUnderTitle.copyWith(
                    border: Border.all(color:Color(0xffD0021B),width: 2.0)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(padding:EdgeInsets.all(5),child:

              Text(anime.attributes.favoritesCount.toString()+" Favorites",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
              ),
                decoration: InfoUnderTitle.copyWith(
                    border: Border.all(color:Color(0xffD0021B),width: 2.0)
                ),
              ),
            ),



          ],),

          Container(width: WidthOfScreen,height: 20,),

          Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffEDF1F5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    border: Border.all(color: Color(0xffD0021B), width: 2.0,),
                    boxShadow: [
                      BoxShadow( color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),

                      )]
                ),


                child: Column(children: <Widget>[

                  Row(mainAxisAlignment: MainAxisAlignment.center ,children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RatingCircles(WidthOfScreen, WidthOfScreen, anime.attributes.averageRating, Colors.green, "Viewer Rating"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RatingCircles(WidthOfScreen, WidthOfScreen, anime.attributes.popularityRank.toString(), Color(0xff029FD0), "Popularity Rank"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RatingCircles(WidthOfScreen, WidthOfScreen, episodeCount(anime.attributes.episodeCount), Color(0xffD0AF02), "Episode Count"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RatingCircles(WidthOfScreen, WidthOfScreen, anime.attributes.episodeLength.toString(), Color(0xffD0021B), "Episode Length"),
                    ),

                  ],

                  )











                ],),
              )
          )









        ]),

    );
  }


  ImageProvider coverImage(){

    NetworkImage returnedImage ;
    ImageProvider placeholderImage;

    if(anime.attributes.coverImage==null|| anime.attributes.coverImage.original == null){
      placeholderImage = Image.asset("assets/images/nullCoverImage.jpg").image;
      return Image.asset("assets/images/nullCoverImage.jpg").image;
    }

    else if(anime.attributes.coverImage.original == null){
      placeholderImage = Image.asset("assets/images/nullCoverImage.jpg").image ;
      return placeholderImage;

    }

    else if((returnedImage = NetworkImage(anime.attributes.coverImage.original)) == null){
      placeholderImage = Image.asset("assets/images/nullCoverImage.jpg").image ;
      return placeholderImage;
    }

    else
     return NetworkImage(anime.attributes.coverImage.original);


  }

  Stack getRatingCircles(double widthOfCircle, double heightOfCircle, String number,Color color){
    if(color == Colors.green){
      number = double.parse(number).round().toString();
    }
    else if(color != Color(0xffD0AF02)){
      number = int.parse(number).toString();
    }
    return Stack(alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width:widthOfCircle/5,
          height:heightOfCircle/5,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow( color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3),

                )]
          ),

        ),
        Container(
          width: widthOfCircle/7,
          height: heightOfCircle/7,
          decoration: BoxDecoration(color: Color(0xff6C7476),shape: BoxShape.circle),
          child: Center(child: Text(number,style: TextStyle(fontSize:20,color: Color(0xffEDF1F5),fontWeight: FontWeight.w900),textAlign: TextAlign.center,)),
        )


      ],
    );


  }

  Column RatingCircles(double widthOfCircle, double heightOfCircle, String number,Color color,String section){
    return Column(children: <Widget>[
      getRatingCircles(widthOfCircle, heightOfCircle,number,color),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
        child: Center(
            child: Container(
                width:widthOfCircle/5,
                child: Text(section,
                  style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),
                  textAlign: TextAlign.center,
                )
            )
        ),
      ),
      //Text("Rating",style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w900)),)
    ],);

  }

  String episodeCount( int episodecount){
    if(episodecount == null){
      String onGoing = "OnGo";
      return onGoing;

    }
    return episodecount.toString();

  }

}





