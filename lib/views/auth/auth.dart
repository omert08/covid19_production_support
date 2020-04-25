import 'package:flutter/material.dart';
import 'package:covid19_production_app/views/auth/signin.dart';
import 'package:covid19_production_app/views/auth/signup.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView:toggleView);
    }
    else{
      return SignUp(toggleView: toggleView);
    }
      
  }
}