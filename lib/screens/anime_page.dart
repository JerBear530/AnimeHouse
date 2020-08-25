
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphqltutorial/models/EpisodeData.dart';
import 'package:graphqltutorial/models/dataStreaming.dart';
import 'package:provider/provider.dart';
import '../models/Anime.dart';
import 'package:graphqltutorial/shared/constants.dart';
import 'package:http/http.dart' as http;


import '../models/user.dart';

class AnimePage extends StatefulWidget{
  final Anime anime;

  const AnimePage({Key key, @required this.anime}) : super(key: key);

  @override _AnimePage createState()=> _AnimePage();

}

class _AnimePage extends State<AnimePage> {
  bool flag = true;


  Icon addToListIcon;
  Icon favorited;
  List<String> originalList;
  String dropdownValue;
  bool listFlag;







  @override
  void initState() {
    super.initState();
    dropDownList();
    listIconChange();
    favoritesIconChange();








  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  void deactivate() {

    super.deactivate();

  }



  @override
  Widget build(BuildContext context) {
    final WidthOfScreen = MediaQuery.of(context).size.width;
    //final HeightOfScreen =  MediaQuery.of(context).size.height;
    final CoverImageConatinerHeight = MediaQuery.of(context).size.height/4;
    final CoverImageContainerWidth = MediaQuery.of(context).size.width;
    final PosterImageContainerPositionLeft =  (MediaQuery.of(context).size.width/2)-((MediaQuery.of(context).size.width/3)/2);
    final PosterImageContainerHeight = MediaQuery.of(context).size.height/4;
    final PosterImageContainerWidth = MediaQuery.of(context).size.width/3;
    final user = Provider.of<User>(context);





    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
            thickness: 0,

          ),
          itemCount: originalList.length,
          itemBuilder: (context, index) => tile(originalList[index],user.uid),
        );


      });

    }





print(widget.anime.relationships.streamingLinks.links.related);
    //print(widget.anime.links.self);

    return Scaffold(
      backgroundColor: Color(0xff6C7476),
        floatingActionButton:Column(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
          FloatingActionButton(child: addToListIcon,backgroundColor: Color(0xffEDF1F5),shape: CircleBorder(side: BorderSide(color: Color(0xffD0021B))), heroTag: null,onPressed: () {
            _showSettingsPanel();

           setState(() {
             listIconChange();
           });


    }),
          FloatingActionButton(child: favorited, heroTag: null,backgroundColor: Color(0xffEDF1F5),shape: CircleBorder(side: BorderSide(color: Color(0xffD0021B))),onPressed: (){
            favoritesIconChange();
            setState(() {

              widget.anime.favorited=!widget.anime.favorited;
            });



          },)

        ],),

        body:


        SingleChildScrollView(
          child: Column(children: <Widget>[

            Stack(children: <Widget>[

              //CoverImage of Anime
              coverImageContainer(CoverImageConatinerHeight, CoverImageContainerWidth, coverImage()),

              //PosterImage of Anime
              Positioned(left: PosterImageContainerPositionLeft, bottom:-(CoverImageConatinerHeight/3),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                        child:posterImageContainer(PosterImageContainerHeight, PosterImageContainerWidth, widget.anime.attributes.posterImage.small)
                    ),
                  ),
                ))
            ], overflow: Overflow.visible),

             //Title Of Anime
             Padding(
               padding: const EdgeInsets.fromLTRB(0,55,0,0),
               child: animeTitleContainer(widget.anime.attributes.canonicalTitle, WidthOfScreen),
             ),

            extraInfo(widget.anime.attributes.showType,widget.anime.attributes.ageRating,widget.anime.attributes.status,widget.anime.attributes.favoritesCount),


            //seperation container from minor info
            Container(width: WidthOfScreen,height: 20,),
            //dropdown(WidthOfScreen),
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
                      child: datesColumn(widget.anime.attributes.startDate,WidthOfScreen,"Air Date"),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                      child: datesColumn(widget.anime.attributes.endDate,WidthOfScreen,"End Date")
                    ),

                  ],),
                ),

                Container(width: MediaQuery.of(context).size.width,height: 1 ,color:Color(0xffD0021B),),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: getSynopsisContainer(widget.anime.attributes.synopsis),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Stream Here'),
                ),

                FutureBuilder<List<Widget>>(
                  future:returnColumns(),
                  builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return snapshot.data[index];
                          }
                      );
                    }
                    else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }

                ),

                FutureBuilder<List<Widget>>(
                    future:returnRows(),
                    builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot){
                      if(snapshot.hasData){
                        return SizedBox(height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return snapshot.data[index];
                              }
                          ),
                        );
                      }
                      else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }

                ),




                Padding(
                  padding: const EdgeInsets.fromLTRB(0,75,0,10),
                  child: Container(width: MediaQuery.of(context).size.width,height: 1 ,color:Color(0xffD0021B),),
                ),







              ],),
            )
          ]),
        ),

    );
  }



  Future <List<Widget>> returnColumns() async{

    StreamingData streaming= await fetchStreamingData();
    return createColumns(streaming);
  }

  Future <List<Widget>> returnRows()async{
    if(widget.anime.attributes.showType=='movie'){
      return null;
    }
    EpisodeData episodes= await fetchEpisodeData();
    print(episodes.data[1].attributes.thumbnail.original);
    return createRows(episodes);

  }

  Future<EpisodeData> fetchEpisodeData() async{
  http.Response response;

  if(widget.anime.relationships.episodes.links.related.contains("kitsu.io/api/edge")) {

    response = await http.get(widget.anime.relationships.episodes.links.related);

  }
  else {

    response = await http.get("https://kitsu.io/api/edge" + widget.anime.relationships.episodes.links.related);
  }

  if(response.statusCode ==200){
    print('recieved episode data');
    return EpisodeData.fromJson(json.decode(response.body));


  }else{
    throw Exception('Failed to load episode data');
  }




  }

  Future<StreamingData> fetchStreamingData() async{

    http.Response response;

    if(widget.anime.relationships.streamingLinks.links.related.contains("https://www.kitsu.io/api/edge")) {
      response =
      await http.get(widget.anime.relationships.streamingLinks.links.related);
    }

    else {
      response = await http.get("https://www.kitsu.io/api/edge" +
          widget.anime.relationships.streamingLinks.links.related);
    }

    if(response.statusCode ==200){
      print('recieved streaming data');
      return StreamingData.fromJson(json.decode(response.body));


    }else{
      throw Exception('Failed to load  streaming data');
    }


  }

  void favoritesIconChange(){
    if(widget.anime.favorited==false){
      favorited=Icon(Icons.grade,color: Colors.black,);
    }
    else{
      favorited=Icon(Icons.grade,color:Color(0xffD0021B),);
    }
  }

  void listIconChange(){
    if(widget.anime.onHold || widget.anime.wantToWatch || widget.anime.watching || widget.anime.dropped || widget.anime.completed ==true){
      addToListIcon=Icon(Icons.check,color: Color(0xffD0021B),);
    }
    else{
      addToListIcon=Icon(Icons.add,color:Color(0xffD0021B),);
    }
  }


  Widget getSynopsisContainer(String synopsis){

    String firstHalf;
    String secondHalf;

    if(synopsis.length> 300){
      firstHalf = synopsis.substring(0,300);
      secondHalf = synopsis.substring(300,synopsis.length);

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
          text: TextSpan(text: "Synopsis: ",style: TextStyle(color: Color(0xffD0021B),fontSize:18,fontWeight: FontWeight.bold ),
              children:<TextSpan>[

                TextSpan(text: firstHalf,style: TextStyle(color: Colors.black))
              ]
          ),

        ): Column(
            children: <Widget>[
              RichText(
                text: TextSpan(text: "Synopsis: ",style: TextStyle(color: Color(0xffD0021B),fontSize:18,fontWeight: FontWeight.bold),
                    children:<TextSpan>[

                      TextSpan(text: flag ? (firstHalf + "...") : (firstHalf + secondHalf),style: TextStyle(color: Colors.black,fontSize:14,fontWeight: FontWeight.normal))
                    ]
                ),

              ),


              //Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),

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



  void dropDownList(){
    if(widget.anime.completed==true){
      originalList=['Completed','Watching','Dropped','On Hold','Want to Watch','Remove','Nevermind'];
      dropdownValue = 'Completed';
    }
    else if(widget.anime.watching==true){
      originalList=['Completed','Watching','Dropped','On Hold','Want to Watch','Remove','Nevermind'];
      dropdownValue = 'Watching';
    }
    else if(widget.anime.dropped==true){
      originalList=['Completed','Watching','Dropped','On Hold','Want to Watch','Remove','Nevermind'];
      dropdownValue = 'Dropped';


    }
    else if(widget.anime.wantToWatch==true){
      originalList=['Completed','Watching','Dropped','On Hold','Want to Watch','Remove','Nevermind'];
      dropdownValue = 'Want to Watch';
    }

    else if(widget.anime.onHold==true){
      originalList=['Completed','Watching','Dropped','On Hold','Want to Watch','Remove','Nevermind'];
      dropdownValue = 'On Hold';

    }

    else{originalList=['Completed','Watching','Dropped','On Hold','Want to Watch','Nevermind'];
    dropdownValue='Add to Library';
    }


  }





  tile(String tileName,String userid)  {

    return ListTile(title: Center(child: Text(tileName)),onTap: () async {
      if(dropdownValue==tileName || tileName=='Nevermind'){
        print('you chose the same value');
        Navigator.pop(context);


      }
      else {
        switch (dropdownValue) {
          case 'Completed':
            {


              widget.anime.completed = !widget.anime.completed;

              await Firestore.instance.collection('library').document(userid).updateData({'completed':FieldValue.arrayRemove([widget.anime.okay()]) });

              print('Removed from completed list');

              break;
            }
          case 'Watching':
            {
              widget.anime.watching = ! widget.anime.watching;
              await Firestore.instance.collection('library').document(userid).updateData({'watching':FieldValue.arrayRemove([widget.anime.okay()]) });

              print('Removed from watching list');
              break;
            }
          case 'Want to Watch':
            {
              widget.anime.wantToWatch = !widget.anime.wantToWatch;
              await Firestore.instance.collection('library').document(userid).updateData({'wantToWatch':FieldValue.arrayRemove([widget.anime.okay()]) });
              print('Removed from want to want to watchlist');
              break;
            }
          case 'On Hold':
            {
              widget.anime.onHold = !widget.anime.onHold;
              await Firestore.instance.collection('library').document(userid).updateData({'onhold':FieldValue.arrayRemove([widget.anime.okay()]) });
              print('Removed from on holding');
              break;
            }

          case 'Dropped':
            {
              widget.anime.dropped = !widget.anime.dropped;
              await Firestore.instance.collection('library').document(userid).updateData({'dropped':FieldValue.arrayRemove([widget.anime.okay()]) });
              print('Removed from dropped list');
              break;
            }


          default:
            {
              originalList.removeWhere((element) =>
              element == 'Add to Library');
              originalList.insert(5,'Remove');
              print('added removed to drop down list and renoved add to library');
            }
        }
        switch (tileName) {
          case'Completed':
            {
              widget.anime.completed = ! widget.anime.completed;
              await Firestore.instance.collection('library').document(userid).updateData({'completed':FieldValue.arrayUnion([widget.anime.okay()])});
              print('added to completed list');

              setState(() {
                dropdownValue = 'Completed';
              });

              break;
            }
          case'Watching':
            {
              widget.anime.watching = !  widget.anime.watching;
              await Firestore.instance.collection('library').document(userid).updateData({'watching':FieldValue.arrayUnion([widget.anime.okay()])});
              print('added to watching list');

              setState(() {
                dropdownValue = 'Watching';
              });

              break;
            }

          case'Want to Watch':
            {
              widget.anime.wantToWatch = ! widget.anime.wantToWatch;
              await Firestore.instance.collection('library').document(userid).updateData({'wantToWatch':FieldValue.arrayUnion([widget.anime.okay()])});
              print('added to want to watch list');

              setState(() {
                dropdownValue = 'Want to Watch';
              });

              break;
            }

          case 'On Hold':
            {
              widget.anime.onHold = !widget.anime.onHold;
              await Firestore.instance.collection('library').document(userid).updateData({'onhold':FieldValue.arrayUnion([widget.anime.okay()])});
              print('added to on holding');

              setState(() {
                dropdownValue = 'On Hold';
              });

              break;
            }

          case 'Dropped':
            {
              widget.anime.dropped = !widget.anime.dropped;
              await Firestore.instance.collection('library').document(userid).updateData({'dropped':FieldValue.arrayUnion([widget.anime.okay()])});
              print('added to dropped list');
              setState(() {
                dropdownValue = 'Dropped';
              });

              break;
            }


          default:
            {
              print('removing from library');
              originalList.removeWhere((element) => element == 'Remove');
              //originalList.insert(0, 'Add to Library');
              setState(() {
                dropdownValue = 'Add to Library';
              });

            }
        }

        Navigator.pop(context);
      }



    },);



  }

}





