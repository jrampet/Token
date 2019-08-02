import 'package:flutter/material.dart';
import 'package:token/homepage.dart';
import 'package:token/signuppage.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context)=>new MyApp(),
        '/signup':(BuildContext context)=> new Signup(),
        '/homepage':(BuildContext context)=> new HomePage()
      },
     
    );
  }
}



