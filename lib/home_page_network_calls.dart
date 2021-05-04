
import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/PopularAnimeCollection.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';



  Future<PopularAnimeCollection> getPopularAnime()async{
    final animes = await fetchPopularAnime();
    return animes;
  }

  Future<PopularAnimeCollection>getCurrentSeasonAnime(String season,String seasonYear)async{
    final animes = await fetchCurrentSeason();
    return animes;
  }

  Future<PopularAnimeCollection> getSeasonedAnime(String season, String year)async{
    final animes = await fetchSeasonedAnime(season, year);
    return animes;
  }

  Future<PopularAnimeCollection> getSportsAnime()async{
    final animes = await fetchSportsAnime();
    return animes;

  }

  Future<PopularAnimeCollection> getNetflixAnime()async{
    final animes = await fetchNetflixAnime();
    return animes;
  }


  Future<PopularAnimeCollection> fetchNetflixAnime()async{

    var queryParameters = {
      'fields[anime]':'slug,posterImage,coverImage',
      'sort':'-userCount',
      'filter[streamers]':'Netflix'

    };

    var uri= Uri.https('www.kitsu.io', '/api/edge/anime',queryParameters);

    final response = await http.get(uri);

    if(response.statusCode==200){
      print('we got netflix data');
      return PopularAnimeCollection.fromJson(json.decode(response.body));
    }
    else{
      print("This is the status code for Netflix anime:" + response.statusCode.toString());
      print('we couldnt get netflix data');
      return null;
    }

  }

  Future<PopularAnimeCollection> fetchSportsAnime()async{

    var queryParameters = {
      'fields[anime]':'slug,posterImage,coverImage,id',
      'filter[categories]':'sports',
      'sort':'-userCount'

    };

    var uri = Uri.https('www.kitsu.io', '/api/edge/anime',queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200){
      print("We got the sports anime");
      return PopularAnimeCollection.fromJson(json.decode(response.body));
    }
    else{
      print("This is the status code for sports anime:" + response.statusCode.toString());
      //print('Error in receiving sports anime');
      Fluttertoast.showToast(
          msg: "Error when fetching sports anime",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.white,
          textColor: Color(0xFF305F72)
      );
      return null;
    }
  }


  Future<PopularAnimeCollection> fetchCurrentSeason()async{
    var queryParameters = {
      'fields[anime]':'slug,posterImage,synopsis,coverImage,id',
      'filter[seasonYear]':'2020',
      'filter[season]':'summer',
      'page[limit]':'10',
      'sort':'-userCount'


    };
    var uri= Uri.https('www.kitsu.io', '/api/edge/anime',queryParameters);
    final response =
    await http.get(uri);

    if (response.statusCode == 200){
      print("We got current anime!");
      return PopularAnimeCollection.fromJson(json.decode(response.body));
    }
    else{
      print("This is the status code for current season anime:" + response.statusCode.toString());
      Fluttertoast.showToast(
          msg: "Error when fetching popular data",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.white,
          textColor: Color(0xFF305F72)
      );
      return null;
    }
  }


  Future<PopularAnimeCollection> fetchPopularAnime()async{

    var queryParameters={
      'fields[anime]':'slug,posterImage,synopsis,coverImage,id',
      'page[limit]':'10',
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
      print("This is the status code for popular anime:" + response.statusCode.toString());
      Fluttertoast.showToast(
          msg: "Error when fetching popular data",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.white,
          textColor: Color(0xFF305F72)
      );
      return null;
    }
  }

  Future<PopularAnimeCollection> fetchSeasonedAnime(String season, String seasonYear) async{

    var queryParameters={
      'page[limit]':'10',
      'filter[season]':season,
      'filter[seasonYear]':seasonYear,
      'sort':'-userCount'
    };

    var uri= Uri.https('www.kitsu.io', '/api/edge/anime',queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200){
      print("We got the seasoned anime");
      return PopularAnimeCollection.fromJson(json.decode(response.body));
    }

    else{
      print("This is the status code: for previous season animes:" + response.statusCode.toString());
      Fluttertoast.showToast(
          msg: "Error when logging in",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Color(0xFF305F72),
          textColor: Colors.white
      );
      return null;
    }
  }