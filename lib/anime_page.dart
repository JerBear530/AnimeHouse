
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Anime.dart';
import 'package:graphqltutorial/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnimePage extends StatefulWidget{
  final Anime anime;

  const AnimePage({Key key, @required this.anime}) : super(key: key);

  @override _AnimePage createState()=> _AnimePage();

}

class _AnimePage extends State<AnimePage> {
  bool flag = true;

  @override
  void initState() {
    super.initState();
  }


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


        SingleChildScrollView(
          child: Column(children: <Widget>[

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
                                image: DecorationImage(image: NetworkImage(widget.anime.attributes.posterImage.small),fit:BoxFit.contain,),
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
               Text(widget.anime.attributes.canonicalTitle, style: GoogleFonts.anton(textStyle: TextStyle(color: Colors.white,fontSize: 20,)),textAlign: TextAlign.center, ))),
             ),

            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2,2,2,2),
                child: Container(padding:EdgeInsets.all(5),child:

                  Text(widget.anime.attributes.showType+"-"+widget.anime.attributes.ageRating,
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

                Text("Status: "+widget.anime.attributes.status,
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

                Text(widget.anime.attributes.favoritesCount.toString()+" Favorites",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                ),
                  decoration: InfoUnderTitle.copyWith(
                      border: Border.all(color:Color(0xffD0021B),width: 2.0)
                  ),
                ),
              ),



            ],),
            //seperation container from minor info
            Container(width: WidthOfScreen,height: 20,),

            //Ratings,Dates,Synopsis, and Trailer Info
            Container(
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
                    child: RatingCircles(WidthOfScreen, WidthOfScreen, episodeCount(double.parse(widget.anime.attributes.averageRating).round()), Colors.green, "Viewer Rating"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: RatingCircles(WidthOfScreen, WidthOfScreen, episodeCount(widget.anime.attributes.popularityRank), Color(0xff029FD0), "Popularity Rank"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: RatingCircles(WidthOfScreen, WidthOfScreen, episodeCount(widget.anime.attributes.episodeCount), Color(0xffD0AF02), "Episode Count"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: RatingCircles(WidthOfScreen, WidthOfScreen, episodeCount(widget.anime.attributes.episodeLength), Color(0xffD0021B), "Episode Length"),
                  ),

                ],),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center ,children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,5,0),
                      child: Column(
                        children: <Widget>[
                          Container(padding: EdgeInsets.all(6.0),width:MediaQuery.of(context).size.width/2.5, decoration: BoxDecoration(
                            color: Color(0xffEDF1F5),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Color(0xffD0021B)),
                          ),
                            child: Text(convertDate(widget.anime.attributes.startDate),style: GoogleFonts.roboto(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                          ),
                          Text("Air Date",style: GoogleFonts.roboto(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: Column(
                        children: <Widget>[
                          Container(padding: EdgeInsets.all(6.0),width:MediaQuery.of(context).size.width/2.5, decoration: BoxDecoration(
                            color: Color(0xffEDF1F5),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Color(0xffD0021B)),
                          ),
                            child: Text(convertDate(widget.anime.attributes.endDate),style: GoogleFonts.roboto(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                          ),
                          Text("End Date",style: GoogleFonts.roboto(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),

                  ],),
                ),

                Container(width: MediaQuery.of(context).size.width,height: 1 ,color:Color(0xffD0021B),),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: getSynopsisContainer(widget.anime.attributes.synopsis),
                ),

                Container(width: MediaQuery.of(context).size.width,height: 1 ,color:Color(0xffD0021B),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: youTubeVideo(widget.anime.attributes.youtubeVideoId),
                )




















              ],),
            )









          ]),
        ),

    );
  }

  String convertDate(String date){

    if(date !=null) {
      DateTime animeDate = DateTime.parse(date);
      var newFormat = DateFormat.yMMMMd().format(animeDate);
      return newFormat;
    }
    else{
      return "On Going Anime";

    }
  }

  Widget getSynopsisContainer(String synopsis){

    String firstHalf;
    String secondHalf;

    if(synopsis.length> 50){
      firstHalf = synopsis.substring(0,50);
      secondHalf = synopsis.substring(50,synopsis.length);

    }
    else{
      firstHalf=synopsis;
      secondHalf="";

    }

    return
      Container(padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffEDF1F5),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Color(0xffD0021B))
        ),
        child:secondHalf.isEmpty? RichText(
          text: TextSpan(text: "Synopsis: ",style: TextStyle(color: Color(0xffD0021B)),
              children:<TextSpan>[

                TextSpan(text: firstHalf,style: TextStyle(color: Colors.black))
              ]
          ),

        ): Column(
            children: <Widget>[

              Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),

              InkWell(
              child: Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[

                new Text(flag ? "show more" : "show less",style: new TextStyle(color: Colors.blue),),
              ],),
              onTap: () {
                setState(() {
                  flag = !flag;}
                  );
                },
            ),
            ]
        )

      );


  }

  Widget youTubeVideo(String videoId){
    if (videoId== null){
      videoId="";
      return Container(child:Text("anime trailer is unavailable...sorrrry"));
    }

      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    _controller.setVolume(50);

    return Container(padding:EdgeInsets.all(10),child: YoutubePlayer(

      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,

    ),decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Color(0xffD0021B))

    ),);






  }



















  ImageProvider coverImage(){

    NetworkImage returnedImage ;
    ImageProvider placeholderImage;

    if(widget.anime.attributes.coverImage==null|| widget.anime.attributes.coverImage.original == null){
      placeholderImage = Image.asset("assets/images/nullCoverImage.jpg").image;
      return Image.asset("assets/images/nullCoverImage.jpg").image;
    }

    else if(widget.anime.attributes.coverImage.original == null){
      placeholderImage = Image.asset("assets/images/nullCoverImage.jpg").image ;
      return placeholderImage;

    }

    else if((returnedImage = NetworkImage(widget.anime.attributes.coverImage.original)) == null){
      placeholderImage = Image.asset("assets/images/nullCoverImage.jpg").image ;
      return placeholderImage;
    }

    else
     return NetworkImage(widget.anime.attributes.coverImage.original);


  }

  Stack getRatingCircles(double widthOfCircle, double heightOfCircle, String number,Color color){
    if(number.isNotEmpty){
      number = int.parse(number).toString();
    }
    else{
      number="UNK";
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
      String onGoing="";
      return onGoing;

    }
    return episodecount.toString();

  }


}





