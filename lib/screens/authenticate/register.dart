import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphqltutorial/models/user.dart';
import 'package:graphqltutorial/services/auth.dart';

class Register extends StatefulWidget{
  @override
  _Register createState()=>_Register();



}

class _Register extends State<Register>{

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth=AuthService();

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    double width = (MediaQuery. of(context). size. width)/2;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/AppBarLogo.png',height: 50,width: 50,),
          backgroundColor: Colors.white,),

        body: Center(child: SingleChildScrollView(child: Column(children: <Widget>[
          Image.asset('assets/images/logo_transparent_background.png',height: 150,width: 150,),


          Container(child: Form(
            key:_formKey,
            child: Column(children: <Widget>[
            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(hintText: "Enter Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);

                  if (!regex.hasMatch(value))
                    return "Enter Valid Email" ;
                  else
                    return null;
                },
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
            ),


            Padding(padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller1,
                decoration: InputDecoration(hintText: 'Enter Passowrd'),
                obscureText: true,validator: (value) {
                return value.length < 6 ? "Password must be at least 6 characters long": null;
              },
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(minWidth: 100,height: 40,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),child: RaisedButton(color: Color(0xFFD0021B),
                  child: Text('Register',style: TextStyle(color: Color(0xffffffff)),),
                  onPressed: ()async{
                if (_formKey.currentState.validate()){
                    CircularProgressIndicator();
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      setState(() {
                        error='There was an error when logging in...Please try again';
                      });
                      Fluttertoast.showToast(
                          msg: error,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.white,
                          textColor: Color(0xFFD0021B)
                      );
                    }else{
                      Navigator.pop(context);
                    }
                }
                    /* User result= await _auth.signInAnon();

                    if (result == null){
                      print('Error');
                    }else{

                      print('signed in');
                      print(result.uid);
                    }*/
                  }
              )),
            ),


          ],),),),

          Text('or',style: TextStyle(color: Colors.lightBlue,fontSize: 10,decoration: TextDecoration.underline),),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(minWidth: width,height: 40,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: RaisedButton.icon(color: Color(0xFFD0021B), icon: Icon(Icons.android),label: Text('Register with Google'),
                    onPressed: (){

                    })),
          )

        ])))

    );

  }




}
