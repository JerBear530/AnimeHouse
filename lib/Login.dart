import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphqltutorial/shared_preferences_service.dart';
import 'LoginModel.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


class Login extends StatefulWidget{
  Login({Key key}): super(key:key);

  @override
  _LoginState createState()=> _LoginState();

}
class _LoginState extends State<Login> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final Fluttertoast showToast = Fluttertoast();

  Uri oauth2 = Uri.parse("https://kitsu.io/api/oauth/token");
  String _token="";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimeTracker',
      theme: ThemeData(
          primaryColor: Color(0xFFD0021B),
          accentColor: Color(0xff908E8E),
          backgroundColor:  Color(0xff908E8E)

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/AppBarLogo.png',height: 50,width: 50,),
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: SingleChildScrollView(

              child: Column(children: <Widget>[
                Image.asset('assets/images/logo_transparent_background.png',height: 150,width: 150,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Enter Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'Enter valid email';
                      else
                        return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller1,
                    decoration: InputDecoration(hintText: 'Enter Passowrd'),
                    obscureText: true,
                    validator: (value) {
                      return value.length < 4
                          ? "Password must be at least 4 characters long"
                          : null;
                    },

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(minWidth: 100,height: 40,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),child: RaisedButton(color: Color(0xFFD0021B),
                      child: Text('Login',style: TextStyle(color: Color(0xffffffff)),),
                      onPressed: (){
                        CircularProgressIndicator();
                        resourceOwnerPasswordGrant(
                            oauth2, _controller.text, _controller1.text).then((value) async{
                          _token=value.access_token;
                          await sharedPreferenceService.setToken(_token);
                          Navigator.pushReplacementNamed(context, "/bottom_navigation");
                          throw("Login Failed!");
                        });

                      })),
                ),
                Text('or',style: TextStyle(color: Colors.lightBlue,fontSize: 10,decoration: TextDecoration.underline),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(minWidth: 150,height: 40,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),child: RaisedButton(color: Color(0xFFD0021B),
                      child: Text('Sign up with Kitsu',style: TextStyle(color: Color(0xffffffff)),),
                      onPressed: (){
                        _launchURL();
                      })),
                ),
                Text('DONT SIGN UP USING FACEBOOK ELSE LOGIN WILL FAIL IN APP',style: TextStyle(fontSize: 10,color: Colors.orange),)


              ],),
            )
        ),

      ),

    );
  }

  _launchURL() async {
    const url = 'https://kitsu.io';

    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'Could not launch $url';
    }
  }


  Future<LoginResponse> resourceOwnerPasswordGrant(Uri authorizationEndpoint, String username, String password) async {

    var body = {
      'grant_type': 'password',
      'username': username,
      'password': password
    };

    var headers = <String, String>{
      'Accept': 'application/vnd.api+json',
    };

    final http.Response response = await http.post(authorizationEndpoint,
        headers: headers, body: body);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    }
    else {
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
