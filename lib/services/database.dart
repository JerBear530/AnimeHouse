import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/rober/AndroidStudioProjects/graphqltutorial/lib/models/Anime.dart';


  class DatabaseService{
    final String uid;
    DatabaseService({this.uid});

    //collection reference
    final CollectionReference userCollection = Firestore.instance.collection('users');
    final CollectionReference libraryCollection = Firestore.instance.collection('library');

    Future updateUserData(String name, String userName, String slogan)async{
      return await userCollection.document(uid).setData({
        'name':name,
        'userName':userName,
        'slogan':slogan



      });


    }
    Future createLibrary(List<Anime> completed,List<Anime> watching, List<Anime> dropped, List<Anime> wantToWatch, List<Anime> onHold) async{
      return await libraryCollection.document(uid).setData({
        'watching': watching,
        'completed': completed,
        'dropped':dropped,
        'wantToWatch':wantToWatch,
        'onhold':onHold

      });


    }


  }