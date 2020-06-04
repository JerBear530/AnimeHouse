
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
  String _token = "";

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
          backgroundColor: Color(0xff908E8E)

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/AppBarLogo.png', height: 50, width: 50,),
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: SingleChildScrollView(

              child: Column(children: <Widget>[
                Image.asset(
                  'assets/images/logo_transparent_background.png', height: 150,
                  width: 150,),
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
                  child: ButtonTheme(minWidth: 100,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: RaisedButton(color: Color(0xFFD0021B),
                          child: Text('Login', style: TextStyle(color: Color(
                              0xffffffff)),),
                          onPressed: () {
                            CircularProgressIndicator();
                          })),
                ),
                Text('or', style: TextStyle(color: Colors.lightBlue,
                    fontSize: 10,
                    decoration: TextDecoration.underline),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(minWidth: 150,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: RaisedButton(color: Color(0xFFD0021B),
                          child: Text(
                            'Sign up with Kitsu', style: TextStyle(color: Color(
                              0xffffffff)),),
                          onPressed: () {

                          })),
                ),
                Text('DONT SIGN UP USING FACEBOOK ELSE LOGIN WILL FAIL IN APP',
                  style: TextStyle(fontSize: 10, color: Colors.orange),)


              ],),
            )
        ),

      ),

    );
  }


}

