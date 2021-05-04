import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphqltutorial/models/PosterImage.dart';
import 'package:intl/intl.dart';
import '../models/EpisodeData.dart';
import '../models/dataStreaming.dart';
import 'package:url_launcher/url_launcher.dart';






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





    Container coverImageContainer(double CoverImageContainerHeight, double CoverImageContainerWidth,ImageProvider coverImage) {
      return Container(

          height: CoverImageContainerHeight,
          width: CoverImageContainerWidth,
          decoration: BoxDecoration(
              color: Color(0xffEDF1F5),
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(100),
                bottomRight: const Radius.circular(100),
              ),
              image: DecorationImage(image: coverImage,
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop)),
              border: Border.all(color: Color(0xffD0021B), width: 2.0,),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),

                )
              ])
      );

    }

    Container posterImageContainer(double PosterImageContainerHeight,double PosterImageContainerWidth, PosterImage posterImageLink){
      if(posterImageLink==null || posterImageLink.medium==null){
        return   Container(
            height:PosterImageContainerHeight,
            width:PosterImageContainerWidth,
            decoration:BoxDecoration(
                image: DecorationImage(image: Image.asset('"assets/images/GOMENASAI.jpg').image,fit:BoxFit.contain,),
                border: Border.all(color: Color(0xffD0021B), width: 2.0,),
                color: Color(0xffEDF1F5),
                borderRadius: BorderRadius.all(const Radius.circular(50))
            )
        );

      }


      return  Container(
        height:PosterImageContainerHeight,
        width:PosterImageContainerWidth,
        decoration:BoxDecoration(
            image: DecorationImage(image: NetworkImage(posterImageLink.medium),fit:BoxFit.contain,),
            border: Border.all(color: Color(0xffD0021B), width: 2.0,),
            color: Color(0xffEDF1F5),
            borderRadius: BorderRadius.all(const Radius.circular(50))
        )
      );
    }

    Container animeTitleContainer(String animeTitle, double screenWidth){

      return Container(width:screenWidth,margin: EdgeInsets.all(15),child: Center(child:
      Text(animeTitle, style: GoogleFonts.anton(textStyle: TextStyle(color: Colors.white,fontSize: 20,)),textAlign: TextAlign.center, )));


    }

   Row extraInfo(String showType,String ageRating,String status,int favoritesCount){

      return Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(2,2,2,2),
          child: Container(padding:EdgeInsets.all(5),child:

          Text(showType+"-"+ageRating,
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

          Text("Status: "+status,
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

          Text(favoritesCount.toString()+" Favorites",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
          ),
            decoration: InfoUnderTitle.copyWith(
                border: Border.all(color:Color(0xffD0021B),width: 2.0)
            ),
          ),
        ),



      ],);


   }

    String episodeCount( int episodecount){

      if(episodecount == null){
        String onGoing="";
        return onGoing;

      }
      return episodecount.toString();

    }

    Stack getRatingCircles(double widthOfCircle, double heightOfCircle, String number,Color color){
      if(number.isNotEmpty){
        number = int.parse(number).toString();
      }
      else{
        number="N/A";
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

   Column datesColumn(String date, double WidthofScreen,String AirorEnd) {
     return Column(
       children: <Widget>[
         Container(padding: EdgeInsets.all(6.0), width: WidthofScreen / 2.3, decoration: BoxDecoration(
           color: Color(0xffEDF1F5),
           borderRadius: BorderRadius.all(Radius.circular(20)),
           border: Border.all(color: Color(0xffD0021B)),
             boxShadow: [
               BoxShadow( color: Colors.black.withOpacity(0.3),
                 spreadRadius: 3,
                 blurRadius: 2,
                 offset: Offset(0, 3),

               )]
         ),
           child: Text(convertDate(date),
             style: GoogleFonts.roboto(color: Colors.black,
                 fontSize: 15,
                 fontWeight: FontWeight.w900), textAlign: TextAlign.center,),

         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(AirorEnd, style: GoogleFonts.roboto(
               color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
             textAlign: TextAlign.center,),
         )
       ],
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

List<Widget> createRows(EpisodeData episodeData){


  List<Widget> episodes = List<Widget>();
  for(int i =0; i<episodeData.data.length;i++){
    if(episodeData.data[i].attributes.thumbnail==null){
      episodes.clear();
      break;
    }
    episodes.add(
        Stack( children: <Widget>[
          Container(width: 120,height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(5)),
                boxShadow: [
                  BoxShadow( color: Colors.black.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 3),

                  )],
              image: DecorationImage(image: NetworkImage(episodeData.data[i].attributes.thumbnail.original),fit:BoxFit.fill,),
            ),
          ),
          Positioned( left:5, top: 5, child: Text("S"+ episodeData.data[i].attributes.seasonNumber.toString()+ ": E"+episodeData.data[i].attributes.number.toString(), style: TextStyle(color: Colors.white),))]
        ));




  }
  return episodes;


}
List<Widget> createColumns(StreamingData stream){
  List<Widget> banners= List<Widget>();

  if(stream.data.length==0){
    return banners;
  }
  else {
    for (int i = 0; i < stream.data.length; i++) {
      if (stream.data[i].attributes.url.contains('hulu')) {
        print('hulu');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 100,height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/streamBanners/HuluBanner.jpg',),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow( color: Colors.black.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 3),

                  )],
              ),
            ),
          ),
        ),);
      }
      else if (stream.data[i].attributes.url.contains('funimation')) {
        print('funimation');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100,height: 100,
                decoration: BoxDecoration(

                  image: DecorationImage(
                    image: ExactAssetImage(
                        'assets/images/streamBanners/Funimation Banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),

                    )],
                ),
              ),
            )
        ));
      }
      else if (stream.data[i].attributes.url.contains('crunchyroll')) {
        print('crunchyroll');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100,height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                        'assets/images/streamBanners/CrunchyRollBanner.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),

                    )],
                ),
              ),
            )
        ));
      }
      else if (stream.data[i].attributes.url.contains('tubitv')) {
        print('tubitv');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100,height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/streamBanners/TubiTvBanner.png'),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),

                    )],
                ),
              ),
            )
        ));
      }
      else if (stream.data[i].attributes.url.contains('netflix')) {
        print('netflix');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100,height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/streamBanners/NetflixBanner.png'),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),

                    )],
                ),
              ),
            )
        ));
      }
      else if (stream.data[i].attributes.url.contains('amazon')) {
        print('amazon');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100,height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/images/streamBanners/PrimeVideoBanner.jpg'),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),

                    )],
                ),
              ),
            )
        ));
      }
      else if (stream.data[i].attributes.url.contains('vrv')) {
        print('vrv');
        banners.add(InkWell(onTap: ()
        {
          _launchURL(stream.data[i].attributes.url);
        },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100,height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/streamBanners/VRVBanner.jpg'),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),

                    )],
                ),
              ),
            )
        ));
      }
      else{
        print('none of them');
        banners.add(InkWell(child: Container(),));
      }
    }
  }
  print('End of anime');
  return banners;


}

  _launchURL(String url) async{
      if(await canLaunch(url)){
        await launch(url);
      } else{
        throw 'Could not launch $url';
      }
  }

