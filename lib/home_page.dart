import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/PopularAnimeCollection.dart';
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
Future<PopularAnimeCollection> fetchFilteredAnime() async{

  var queryParameters={
    'page[limit]':'6',
    'page[offset]':'0',
    'filter[season]':'winter',
    'filter[seasonYear]':'2017',
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

  final Fluttertoast showToast = Fluttertoast();
  Future<PopularAnimeCollection> popAnimes;
  Future<PopularAnimeCollection> filAnimes;

  @override
  void initState() {
    super.initState();

    popAnimes=getPopularAnime();
    filAnimes=getFilteredAnime();

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
                  await sharedPreferenceService.clearToken();
                  Navigator.pushReplacementNamed(context, "/login");
                },)
              ],

            ),

            backgroundColor: Colors.white,
            body:

            FutureBuilder(
                future: Future.wait([popAnimes,filAnimes]),
                builder: ( context,  AsyncSnapshot<List<dynamic>>snapshot) {

                  if (snapshot.hasData) {
                    final double itemHeight= (size.height - kToolbarHeight - 24) / 3;
                    final double itemWidth = size.width / 3;
                    List<Widget> widgetList = allTimePopular(snapshot.data[0],itemWidth);
                    List<Widget> widgetList1 = filteredAnimeList(snapshot.data[1],itemWidth);
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
                                    return widgetList[index];
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
                                  return widgetList1[index];
                                }, childCount: widgetList1.length),
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

  Future<PopularAnimeCollection>getFilteredAnime()async{
    final animes = await fetchFilteredAnime();
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



