import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphqltutorial/shared/constants.dart';
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

    return new WillPopScope(
      onWillPop: () async{
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
        },
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          title: Image.asset('assets/images/AppBarLogo.png',height: 50,width: 50,),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,kToolbarHeight/4,12,8),
              child: Text("REGISTER PAGE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ],
          backgroundColor: Color(0xff6C7476),),
        backgroundColor:Color(0xff6C7476) ,

        body: Center(child: SingleChildScrollView(child: Column(children: <Widget>[
          Image.asset('assets/images/AppBarLogo.png',height: 150,width: 150,),


          Container(child: Form(
            key:_formKey,
            child: Column(children: <Widget>[
              Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  decoration: textInputDecoration.copyWith(hintText: "Email"),

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
                  decoration: textInputDecoration.copyWith(hintText: "Password"),
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
                child: ButtonTheme(minWidth: MediaQuery. of(context).size.width,height: 40 ,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white)),buttonColor:Color(0xff6C7476),child: RaisedButton(
                    child: Text('REGISTER',style: TextStyle(color: Color(0xffffffff)),),
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

                    }
                )),
              ),


            ],),),),



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(minWidth:  MediaQuery. of(context).size.width,height: 40,shape:RoundedRectangleBorder(side: BorderSide(color: Colors.white)),buttonColor:Color(0xff6C7476),
                  child: RaisedButton.icon( icon: Image.asset('assets/icons/icons8-google-100.png',height: 30,width: 30,),label: Text('REGISTER WITH GOOGLE',style: TextStyle(color:  Color(0xffffffff)),),
                      onPressed: (){

                      })),
              ),


        ])))

    ),);

  }




}
