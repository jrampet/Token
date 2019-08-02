import 'package:flutter/material.dart';
import 'package:token/data/management.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.person)
                  ),
                onChanged: (value){
                  setState(() {
                   email=value; 
                  });
                },
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock)
                  ),
                onChanged: (value){
                   setState(() {
                   password=value;
                  });
                },
                 obscureText: true,
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: 'Confirm Password',
                icon: Icon(Icons.lock)
                ),
                 onChanged: (value){
                   setState(() {
                   email=password; 
                  });
                },
                 obscureText: true,
              ),
              SizedBox(height:20.0),
              RaisedButton(
                child: Text('SignUP'), 
                color: Colors.deepPurple,
               textColor: Colors.white, 
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email:email,
                    password:password, 
                  ).then((signedinUser){
                    Usermanagement().storeNewUser(signedinUser,context);
                  }).catchError((e){
                    print(e);
                  });
                },),
                SizedBox(height: 15.0),
                Text("Already have an account?"),
                SizedBox(height: 16.0,),
                RaisedButton(
                  child: Text('Login'),
                  color: Colors.deepPurple,
               textColor: Colors.white,  
                  onPressed: () {
                    Navigator.of(context).pushNamed('/landingpage');
                  },
                  
                )

            ],
          ),

        ),
      )
    );
  }
}