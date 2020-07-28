import 'package:flutter/material.dart';
import 'package:graphqltutorial/screens/authenticate/sign_in.dart';
import 'package:graphqltutorial/screens/authenticate/register.dart';


class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState()=>_AuthenticateState();



}

class _AuthenticateState extends State<Authenticate>{

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery. of(context). size. width)/2;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
      backgroundColor: Color(0xffe1e1e1),
      body: Stack(children:<Widget>[
         Image.asset("assets/images/SailorMoonHouse2.jpg",fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),


        Align(alignment:Alignment.topCenter, child:Container(height: height/2,width:width,child: Image.asset("assets/images/AppBarLogo.png",fit: BoxFit.contain,)),),

        Align(
          alignment: Alignment.center,
          child:Container(width: (MediaQuery. of(context). size. width)/1.1 ,
            child: RaisedButton(color: Colors.white,textColor: Color(0xFFD0021B),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                child:Text("SIGN IN HERE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),onPressed: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context) =>SignIn()))}),
          )
        ),

         Align(alignment: Alignment(0.0,0.15),
           child: Container(width: (MediaQuery. of(context). size. width)/1.1,
             child: RaisedButton(color:Colors.white,textColor: Color(0xFFD0021B),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    child:Text("RESIGTER HERE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),onPressed: ()=>{
              // Navigator.pushReplacementNamed(context, "/register")
               Navigator.push(context, MaterialPageRoute(builder: (context) =>Register()))
                 }),
           ),
         ) ,


     ] )






      );





  }

}