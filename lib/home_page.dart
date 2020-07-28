import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/PopularAnimeCollection.dart';
import 'package:graphqltutorial/anime_page.dart';
import 'package:graphqltutorial/services/auth.dart';
import 'package:graphqltutorial/shared_preferences_service.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';



import 'animeList.dart';


Future<PopularAnimeCollection> fetchPopularAnime()async{

  var queryParameters={
    'page[limit]':'6',
    'sort':'-userCount'
  };
  var uri= Uri.https('www.kitsu.io', '/api/edge/trending/anime',queryParameters);
  final response =
  await http.get(uri);

  if (response.statusCode == 200){
    print("We got the popular anime!");
    return PopularAnimeCollection.fromJson(json.decode(response.body));
  }
  else{
    print("This is the status code:" + response.statusCode.toString());
    Fluttertoast.showToast(
        msg: "Error when fetching popular data",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Color(0xFF305F72)
    );
    return null;
  }
}
Future<PopularAnimeCollection> fetchFilteredAnime(String season, String seasonYear) async{

  var queryParameters={
    'page[limit]':'6',
    'page[offset]':'0',
    'filter[season]':season,
    'filter[seasonYear]':seasonYear,
    'sort':'-userCount'
  };

  var uri= Uri.https('www.kitsu.io', '/api/edge/anime',queryParameters);
  final response = await http.get(uri);

    if (response.statusCode == 200){
      print("We got the data");
      var jso=json.decode(response.body);
      return PopularAnimeCollection.fromJson(json.decode(response.body));
    }

    else{
      print("This is the status code:" + response.statusCode.toString());
      Fluttertoast.showToast(
      msg: "Error when logging in",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Color(0xFF305F72),
      textColor: Colors.white
      );
      return null;
    }
}


//void main() => runApp(HomePage());
class HomePage extends StatefulWidget{
  HomePage({Key key}): super(key:key);

  @override
  _HomePage createState()=> _HomePage();

}
class _HomePage extends State<HomePage> {

  final AuthService _auth = AuthService();

  final Fluttertoast showToast = Fluttertoast();
  final String seasonS='spring';
  final String seasonS1='summer';
  final String seasonF='fall';
  final String seasonW='winter';



  final String seasonYear='2019';

  Future<PopularAnimeCollection> popAnimes;
  Future<PopularAnimeCollection> filAnimes;
  Future<PopularAnimeCollection> filAnimes1;
  Future<PopularAnimeCollection> filAnimes2;
  Future<PopularAnimeCollection> filAnimes3;

  @override
  void initState() {
    super.initState();

    popAnimes=getPopularAnime();
    filAnimes=getFilteredAnime(seasonW,seasonYear);
    filAnimes1=getFilteredAnime(seasonF,seasonYear);
    filAnimes2=getFilteredAnime(seasonS1,seasonYear);
    filAnimes3=getFilteredAnime(seasonS,seasonYear);

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home: Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/images/AppBarLogo.png',height: 50,width: 50,),
              backgroundColor: Colors.white,

              actions: <Widget>[
                IconButton(icon: Icon(Icons.exit_to_app,color: Color(0xFFD0021B)), onPressed: () async {
                  await _auth.signOut();
                  //sharedPreferenceService.clearToken();
                  //Navigator.pushReplacementNamed(context, "/login");
                },)
              ],

            ),

            backgroundColor: Colors.white,
            body:

            FutureBuilder(
                future: Future.wait([popAnimes,filAnimes,filAnimes1,filAnimes2,filAnimes3]),
                builder: ( context,  AsyncSnapshot<List<dynamic>>snapshot) {

                  if (snapshot.hasData) {
                    final double itemHeight= (size.height - kToolbarHeight - 24) / 3;
                    final double itemWidth = size.width / 3;
                    List<Widget> widgetList = allTimePopular(snapshot.data[0],itemWidth);
                    List<Widget> widgetList1 = filteredAnimeList(snapshot.data[1],itemWidth);
                    List<Widget> widgetList2 = filteredAnimeList(snapshot.data[2], itemWidth);
                    List<Widget> widgetList3 = filteredAnimeList(snapshot.data[3], itemWidth);
                    List<Widget> widgetList4 = filteredAnimeList(snapshot.data[4], itemWidth);
                    PopularAnimeCollection pop = snapshot.data[0];
                    PopularAnimeCollection season1 = snapshot.data[1];
                    PopularAnimeCollection season2 = snapshot.data[2];
                    PopularAnimeCollection season3 = snapshot.data[3];
                    PopularAnimeCollection season4 = snapshot.data[4];

                    return CustomScrollView(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('All Time Popular', style: TextStyle(
                                      fontSize: 20, color: Colors.black),),

                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: SliverGrid(
                                  delegate: SliverChildBuilderDelegate((context, index) {
                                    return GestureDetector(child: widgetList[index],onTap: (){Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AnimePage(anime: pop.data[index])
                                        )

                                    );},);
                                  }, childCount: widgetList.length),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (itemWidth/itemHeight),
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  )
                              ),
                          ),




                          SliverFixedExtentList(
                            itemExtent: 20, delegate: SliverChildListDelegate([
                            Container(color: Color(0xFFD0021B),)
                          ]),
                          ),



                          SliverToBoxAdapter(
                            child: Container(

                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('Winter 2017', style: TextStyle(fontSize: 20, color: Colors.black),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: SliverGrid(
                                delegate: SliverChildBuilderDelegate((context, index) {
                                  return GestureDetector(child: widgetList1[index],onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AnimePage(anime: season1.data[index])
                                        )

                                    );
                                  },);
                                }, childCount: widgetList1.length),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (itemWidth/itemHeight),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                )
                            ),
                          ),


                          SliverFixedExtentList(
                            itemExtent: 20, delegate: SliverChildListDelegate([
                            Container(color: Color(0xFFD0021B),)
                          ]),
                          ),



                          SliverToBoxAdapter(
                            child: Container(

                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('Winter 2019', style: TextStyle(fontSize: 20, color: Colors.black),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: SliverGrid(
                                delegate: SliverChildBuilderDelegate((context, index) {
                                  return GestureDetector(child: widgetList2[index],onTap:(){Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnimePage(anime: season2.data[index])
                                      )

                                  );});
                                }, childCount: widgetList2.length),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (itemWidth/itemHeight),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                )
                            ),
                          ),

                          SliverFixedExtentList(
                            itemExtent: 20, delegate: SliverChildListDelegate([
                            Container(color: Color(0xFFD0021B),)
                          ]),
                          ),



                          SliverToBoxAdapter(
                            child: Container(

                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('Fall 2019', style: TextStyle(fontSize: 20, color: Colors.black),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: SliverGrid(
                                delegate: SliverChildBuilderDelegate((context, index) {
                                  return GestureDetector(child: widgetList3[index],onTap:(){Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnimePage(anime: season3.data[index])
                                      )

                                  );});
                                }, childCount: widgetList3.length),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (itemWidth/itemHeight),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                )
                            ),
                          ),

                          SliverFixedExtentList(
                            itemExtent: 20, delegate: SliverChildListDelegate([
                            Container(color: Color(0xFFD0021B),)
                          ]),
                          ),



                          SliverToBoxAdapter(
                            child: Container(

                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('Summer 2019', style: TextStyle(fontSize: 20, color: Colors.black),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: SliverGrid(
                                delegate: SliverChildBuilderDelegate((context, index) {
                                  return GestureDetector(child: widgetList4[index],onTap:(){Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => AnimePage(anime: season4.data[index])
                                      )

                                  );
                                  }
                                  );

                                }, childCount: widgetList4.length),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (itemWidth/itemHeight),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                )
                            ),
                          )


                        ]
                    );
                  }

                  else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(child: CircularProgressIndicator());
                })

        )
    );
  }


  Future<PopularAnimeCollection> getPopularAnime()async{
   final animes = await fetchPopularAnime();
    return animes;
  }

  Future<PopularAnimeCollection>getFilteredAnime(String season,String seasonYear)async{
    final animes = await fetchFilteredAnime(season,seasonYear);
    return animes;
  }

  Future<PopularAnimeCollection> resourceOwnerPasswordGrant(String authorizationEndpoint ,String oauth
      ) async {



    var queryParameters = {
      'filter[season]': 'winter',
      'filter[seasonYear]': '2017',

    };

    var headers = <String, String>{
      'Accept': 'application/vnd.api+json',
    };
    var uri =Uri.https(authorizationEndpoint, oauth,queryParameters);
    print(uri.toString());
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return PopularAnimeCollection.fromJson(json.decode(response.body));
    } else {
      print("This is the status code:" + response.statusCode.toString());
      Fluttertoast.showToast(
          msg: "Error when logging in",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Color(0xFF305F72),
          textColor: Colors.white
      );
      return null;
    }
  }
}



