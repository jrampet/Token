import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:token/signuppage.dart';

final color1 =  Color(0xff000000);
final color2 = Color(0xff01b8aa);
final color3 = Color(0xff71f2e8);
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
enum Button {
  Email,
  Google,
  Facebook,
  GitHub,
  LinkedIn,
  Pinterest,
  Tumblr,
  Twitter
}
class _LoginState extends State<Login> {
  String email;
  String password;

  GoogleSignIn googleAuth = new GoogleSignIn(); 
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     backgroundColor: Colors.black,
     body:Center(
       child: Container(
         padding: EdgeInsets.all(25.0),
         child: Column(

           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('Book Token for OP',
             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 15.0,),
             new Image.asset("lib/assets/st.png"), 
             
             TextField(
               style: TextStyle(color: Colors.white),
               decoration: InputDecoration(
                 hintText: 'Email',
                 labelStyle: new TextStyle(color: Colors.white),
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
               icon: Icon(Icons.person,color: Colors.white,)),
               onChanged: (value){
                 setState(() {
                  email=value; 
                 });
               },
             ),
             SizedBox(height: 15.0,),
             TextField(
               style: TextStyle(color: Colors.white),
               decoration: InputDecoration(
                 hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                 labelStyle: new TextStyle(color: Colors.white),
                
               icon: Icon(Icons.lock,color: Colors.white,)),
               
               onChanged: (value){
                 setState(() {
                  password=value; 
                 });
               },
               obscureText: true,
             ),
             SizedBox(height: 20.0),
             RaisedButton(
   
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               
               child: Text('Login',style: new TextStyle(fontWeight:FontWeight.bold)),
               color: Colors.white,
               textColor: Colors.black, 
               onPressed: () {
                 FirebaseAuth.instance.signInWithEmailAndPassword(
                   email: email,
                   password: password
                 ).then((FirebaseUser user){
                   Navigator.of(context).pushReplacementNamed('/homepage');
                 }).catchError((e){
                   print(e);
                 });
               },
             ),
             SizedBox(height: 15.0,),
             Text('Login With Social Account',
                  style: new TextStyle(fontWeight:FontWeight.bold,color: Colors.white)),
             SizedBox(height: 15.0),
             
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  //fb
                    new FloatingActionButton(
                      heroTag: "btn1",
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        
                      },
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints.expand(),
                        child: new Image.asset("lib/assets/fb.png" ,fit: BoxFit.cover, gaplessPlayback: true),
                      ),
                    ),

                    //twitter
                    new FloatingActionButton(
                      heroTag: "btn2",
                                backgroundColor: Colors.transparent,
                              onPressed: () {
                                
                              },
                      child: new ConstrainedBox(
                        constraints: new BoxConstraints(),
                        child: new Image.asset("lib/assets/twitter.png" ,fit: BoxFit.cover, gaplessPlayback: true),
                      ),
                    ),


                    //google 
                      new FloatingActionButton(
                        heroTag: "btn3",
                                  backgroundColor: Colors.transparent,
                                onPressed: () {

                                 googleAuth.signIn().then((result){
                                   result.authentication.then((googleKey){
                                     FirebaseAuth.instance.signInWithGoogle(
                                       idToken: googleKey.idToken,
                                       accessToken: googleKey.accessToken
                                     ).then((signedInUser){
                                       print('Signed in as ${signedInUser.displayName}');
                                       Navigator.of(context).pushReplacementNamed('/homepage');

                                     }).catchError((e){
                                       print(e);
                                     });

                                   }).catchError((e){
                                     print(e);
                                   });
                                 }).catchError((e){print(e);});  
                                },
                        child: new ConstrainedBox(
                          constraints: new BoxConstraints.expand(),
                          child: new Image.asset("lib/assets/google.png" ,fit: BoxFit.cover, gaplessPlayback: true),
                        ),
                      ),
                ],
              ),
               SizedBox(height: 15.0,), 
              Text('Don\'t have an account?',
                  style: new TextStyle(fontWeight:FontWeight.bold,color: Colors.white)),
              new GestureDetector(
              onTap: () {
                 Navigator.of(context).pushNamed('/signup');
              },
              child: new Text("Signup", style: new TextStyle(fontWeight:FontWeight.bold,color: Colors.white,decoration: TextDecoration.underline)),
            ),  
              
             
            
           ],
         ),
       ),
     )

   );
  }
}