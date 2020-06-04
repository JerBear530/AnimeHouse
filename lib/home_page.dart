import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animehousetutorial/shared_preferences_service.dart';
import 'package:fluttertoast/fluttertoast.dart';





class HomePage extends StatefulWidget{
  HomePage({Key key}): super(key:key);

  @override
  _HomePage createState()=> _HomePage();

}
class _HomePage extends State<HomePage> {

  final Fluttertoast showToast = Fluttertoast();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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

            Center(
                child: Text("HomePage", style: TextStyle(fontSize: 30,color: Color(0xFFD0021B) ),))


        ),
    );
  }



}