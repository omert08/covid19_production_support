import 'package:flutter/material.dart';
import 'package:covid19_production_app/models/user.dart';
import 'package:provider/provider.dart';
import 'auth/auth.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    // return either Home or Authenticate widget

    if (user == null){
    return Authenticate();
    }
    else{
      return Home();
    }

  }
}
