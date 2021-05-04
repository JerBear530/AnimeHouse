
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/models/Anime.dart';
import 'package:graphqltutorial/models/PopularAnimeCollection.dart';
import 'package:graphqltutorial/screens/anime_page.dart';
import 'package:graphqltutorial/screens/search.dart';
import 'package:graphqltutorial/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphqltutorial/home_page_network_calls.dart';
import 'package:graphqltutorial/shared/home_page_shared.dart';
import '../shared/animeList.dart';





//void main() => runApp(HomePage());
class HomePage extends StatefulWidget{
  HomePage({Key key}): super(key:key);

  @override
  _HomePage createState()=> _HomePage();

}
class _HomePage extends State<HomePage> {

  final AuthService _auth = AuthService();

  final Fluttertoast showToast = Fluttertoast();


  List<Widget> mostPopularList;
  List<Widget> currentAnimeList;
  List<Widget> previousAnimeList;
  List<Widget> ballIsLifeList;
  List<Widget> netflixList;



  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home: Scaffold(
          backgroundColor: Color(0xff6C7476),
            appBar: AppBar(
              backgroundColor: Color(0xffEDF1F5),
              centerTitle: true,
              title: const Text('HOME',style: TextStyle(color: Color(0xffD0021B),fontSize: 24,fontWeight: FontWeight.bold),),
              leading:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/AppBarLogo.png',  ),

              ),


              actions: <Widget>[
                IconButton(icon: Icon(Icons.exit_to_app,color: Color(0xFFD0021B)), onPressed: () async {
                  await _auth.signOut();
                  //sharedPreferenceService.clearToken();
                  //Navigator.pushReplacementNamed(context, "/login");
                },)
              ],

            ),

          body: FutureBuilder(
            future: Future.wait([getPopularAnime(),getCurrentSeasonAnime('fall', '2019'),getSeasonedAnime('summer', '2019'),getNetflixAnime(),getSportsAnime()]),
            builder: (context,AsyncSnapshot<List<PopularAnimeCollection>>snapshot){

              if(snapshot.hasData){
                final double animeHeight = (MediaQuery.of(context).size.height/4);

                mostPopularList=rowCreator(snapshot.data[0], MediaQuery.of(context).size.width/3,animeHeight);
                currentAnimeList=rowCreator(snapshot.data[1], MediaQuery.of(context).size.width/3, animeHeight);
                previousAnimeList=rowCreator(snapshot.data[2], MediaQuery.of(context).size.width/3, animeHeight);
                netflixList=rowCreator(snapshot.data[3], MediaQuery.of(context).size.width/3, animeHeight);
                ballIsLifeList=rowCreator(snapshot.data[4], MediaQuery.of(context).size.width/3, animeHeight);



                   // Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimePage(anime: snapshot.data[0].data[i],)) );},child: mostPopularList[i]);


                return animePageUI(snapshot.data[0], snapshot.data[1], snapshot.data[2],snapshot.data[3],snapshot.data[4], MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
              }

              else if(snapshot.hasError){

                return Text("${snapshot.error}");
              }

              return Center(child: CircularProgressIndicator(),);

            }




          ),
    ));
  }

  SingleChildScrollView animePageUI(PopularAnimeCollection popularAnime, PopularAnimeCollection currentSeason,PopularAnimeCollection previousSeason,PopularAnimeCollection netflixAnime,PopularAnimeCollection sportsAnime,double widthOfScreen,double heightOfScreen){

    final double showCasedImageContainerHeight = (MediaQuery.of(context).size.height/1.5);
    final double showCasedTitleBottomPosition =((MediaQuery.of(context).size.height/1.5)/2);
    final double showCasedTitleContainerWidth =( MediaQuery.of(context).size.width*3/4);
    final double positionLeft = 15;
    final double showCaseSynopBottomPosition = ((MediaQuery.of(context).size.height/1.5)/3.5);
    final double showCaseSynopWidth = (MediaQuery.of(context).size.width-30);
    final double detailsButtonBottomPosition = ((MediaQuery.of(context).size.height/1.5)/11);
    final double detailsButtonLeftPosition= (MediaQuery.of(context).size.width/4);
    final double detailsButtonContainerWidth = (MediaQuery.of(context).size.width/2);
    final double rowHeight =  ((MediaQuery.of(context).size.height/4)+46);


    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(height: showCasedImageContainerHeight, width: widthOfScreen,
              child: Opacity(opacity: 0.5,
                  child: Image.network( popularAnime.data[0].attributes.posterImage.small, fit: BoxFit.cover)
              ),
            ),

            Positioned(bottom: showCasedTitleBottomPosition, left: positionLeft ,
                child: Container(width: showCasedTitleContainerWidth,
                    child: Text( popularAnime.data[0].attributes.slug.toUpperCase(), style: showCasedTitleStroke,)
                )
            ),

            Positioned(bottom: showCasedTitleBottomPosition, left: positionLeft , child: Container(width: showCasedTitleContainerWidth,child: Text(popularAnime.data[0].attributes.slug.toUpperCase(), style: showCasedTitle,))),

            Positioned(bottom: showCaseSynopBottomPosition, left: positionLeft, child: Container(width: showCaseSynopWidth,child: Text(popularAnime.data[0].attributes.synopsis,overflow: TextOverflow.ellipsis,maxLines: 4,style: synopsisStyle))),


            Positioned(
                bottom: detailsButtonBottomPosition, left: detailsButtonLeftPosition,
                child: GestureDetector(
                    child:Container(width: detailsButtonContainerWidth, decoration: buttonDecortation,
                        child: Center(
                            child: Padding(padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: seeDetailsText,
                            )
                        )
                    )
                )
            )

          ],
        ),


        Padding(
          padding: const EdgeInsets.fromLTRB(0,20,0,0),
          child: Container( width: widthOfScreen, decoration: pageContainerDecoration,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,8,4),
                    child: mostPopularText
                ),

                SizedBox(height: rowHeight,
                  child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: popularAnime.data.length , itemBuilder: (context,index){
                    return mostPopularList[index];
                  }),
                ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,8,4),
                    child: summer2020Text
                ),

                SizedBox(height: rowHeight,
                  child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: currentSeason.data.length , itemBuilder: (context,index){
                    return currentAnimeList[index];
                  }),
                ),
                Container(height: 15,),

                Center(
                  child: Stack(children: [
                    Container(color: Color(0xFFD0021B),width:(MediaQuery.of(context).size.width-20), height:200,),
                    Container(width:(MediaQuery.of(context).size.width-20),child: Image.network(currentSeason.data[0].attributes.coverImage.large,)),
                    Positioned(bottom:  5,right:MediaQuery.of(context).size.width/1.5,child: Container( width: MediaQuery.of(context).size.width/4,height:MediaQuery.of(context).size.height/5 ,child: Image.network(currentSeason.data[0].attributes.posterImage.small))),
                    Positioned(bottom: 80,right:0, child: Container(width:(MediaQuery.of(context).size.width-20)/1.45,child: Text(currentSeason.data[0].attributes.slug.toUpperCase().replaceAll('-', ' '),style: TextStyle(fontSize: 20,color: Colors.white),overflow: TextOverflow.ellipsis,))),
                    Positioned(bottom: 27,right:0, child: Container(width:(MediaQuery.of(context).size.width-20)/1.45,child: Text(currentSeason.data[0].attributes.synopsis,style: TextStyle(fontSize: 10,color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 4,))),

                  ],),
                ),
                Container(height: 15,),

                Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,8,4),
                    child: netflixAndChillText
                ),

                SizedBox(height: rowHeight,
                  child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: netflixAnime.data.length , itemBuilder: (context,index){
                    return netflixList[index];
                  }),
                ),

                Container(height: 15,),
                Center(
                  child: Stack(children: [
                    Container(color: Color(0xFFD0021B),width:(MediaQuery.of(context).size.width-20), height:200,),
                    Container(width:(MediaQuery.of(context).size.width-20),child: Image.network(previousSeason.data[0].attributes.coverImage.large,)),
                    Positioned(bottom:  5,right:MediaQuery.of(context).size.width/1.5,child: Container( width: MediaQuery.of(context).size.width/4,height:MediaQuery.of(context).size.height/5 ,child: Image.network(previousSeason.data[0].attributes.posterImage.small))),
                    Positioned(bottom: 80,right:0, child: Container(width:(MediaQuery.of(context).size.width-20)/1.45,child: Text(previousSeason.data[0].attributes.slug.toUpperCase().replaceAll('-', ' '),style: TextStyle(fontSize: 20,color: Colors.white),overflow: TextOverflow.ellipsis,))),
                    Positioned(bottom: 27,right:0, child: Container(width:(MediaQuery.of(context).size.width-20)/1.45,child: Text(previousSeason.data[0].attributes.synopsis,style: TextStyle(fontSize: 10,color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 4,))),

                  ],),
                ),


                Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,8,4),
                    child: ballIsLifeText
                ),

                SizedBox(height: rowHeight,
                  child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: netflixAnime.data.length , itemBuilder: (context,index){
                    return ballIsLifeList[index];
                  }),
                ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,8,4),
                    child: previousAnimeText
                ),

                SizedBox(height: rowHeight,
                  child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: netflixAnime.data.length , itemBuilder: (context,index){
                    return previousAnimeList[index];
                  }),
                ),

                Container(height: 15),
                Center(child: Text('You have reached the end of the feed.',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),),
                Container(height: 10),
                Center(
                  child: RaisedButton(color: Color(0xFFD0021B),onPressed:() {Navigator.push(context,MaterialPageRoute(builder: (context)=>search()));},child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('VIEW ALL',style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),),
                ),
                Container(height: 20),
              ],
            ),),
        )
      ]),
    );





  }

  Widget firstInRow(double itemWidth, double animeHeight, Anime anime){

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 4, 0, 8),
      child: GestureDetector(onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimePage(anime: anime,)) );
      },
        child: Container(child: Column(
          children: <Widget>[
            Container( width: itemWidth,height: animeHeight,decoration: BoxDecoration(border: Border.all(color: Color(0xffD0021B),width: 1.5),borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),topLeft: Radius.circular(8.0)) ),
              child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                child: Image.network(anime.attributes.posterImage.medium,
                  fit: BoxFit.fill,),
              ),
            ),
            Container(color:Color(0xffD0021B),width:itemWidth,height:30,child: Center(
              child: Text(anime.attributes.slug,overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10,color: Colors.white,),textAlign: TextAlign.center,),
            )
            )
          ],
        ),),
      ),
    );
  }

  Widget lastInRow(double itemWidth, double animeHeight, Anime anime){
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 4, 10, 8),
      child: GestureDetector(
        onTap:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimePage(anime: anime,)) );
          },
        child: Container(child: Column(
          children: <Widget>[
            Container( width: itemWidth,height: animeHeight,decoration: BoxDecoration(border: Border.all(color: Color(0xffD0021B),width: 1.5),borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),topLeft: Radius.circular(8.0)) ),
              child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                child: Image.network(anime.attributes.posterImage.medium,
                  fit: BoxFit.fill,),
              ),
            ),
            Container(color:Color(0xffD0021B),width:itemWidth,height:30,child: Center(
              child: Text(anime.attributes.slug,overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10,color: Colors.white,),textAlign: TextAlign.center,),
            )
            )
          ],
        ),),
      ),
    );



  }

  Widget middleOfRow(double itemWidth, double animeHeight, Anime anime){
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 4, 0, 8),
      child: GestureDetector(
        onTap:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimePage(anime: anime,)) );
        },
        child: Container(child: Column(
          children: <Widget>[
            Container(width: itemWidth,
              height: animeHeight,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffD0021B), width: 1.5),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0))),
              child: ClipRRect(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
                child: Image.network(
                    anime.attributes.posterImage.medium,
                    fit: BoxFit.fill),
              ),
            ),
            Container(color: Color(0xffD0021B),
                width: itemWidth,
                height: 30,
                child: Center(
                  child: Text(anime.attributes.slug,overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: Colors.white,),
                    textAlign: TextAlign.center,),
                )
            )
          ],
        ),),
      ),
    );

  }

  List<Widget> rowCreator(PopularAnimeCollection animes,double itemWidth,double animeHeight){

    List<Widget> animeWidgets = [];

    for (int i = 0; i<animes.data.length;i++){
      if(i==0){
        animeWidgets.add(
            firstInRow(itemWidth, animeHeight,animes.data[i])
        );
      }
      else if(i==animes.data.length-1){
        animeWidgets.add(
            lastInRow(itemWidth, animeHeight, animes.data[i])
        );
      }
      else {
        animeWidgets.add(
            middleOfRow(itemWidth, animeHeight,animes.data[i])
        );
      }
    }
    return  animeWidgets;
  }





}



