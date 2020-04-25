import 'package:flutter/material.dart';
import 'package:covid19_production_app/services/auth.dart';
import 'package:covid19_production_app/shared/change_language.dart';
import 'package:covid19_production_app/shared/constants.dart';
import 'package:covid19_production_app/shared/loading.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';


  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
         elevation: 0.0,
         title: Text('signup').tr(),
         actions: <Widget>[
            FlatButton.icon(
             icon: Icon(Icons.person),
             label: Text('Sign in'),
             onPressed:(){
               widget.toggleView();
             },
            ),
            FlatButton(
            child: Icon(Icons.language),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChangeLanguage(), fullscreenDialog: true),
              );
            },
          ),
         ]
         ),
         body: Container(
           color: Colors.grey[150],
           padding: EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
           child: Form(
             key: _formKey,
             child: Column(
               children: <Widget>[
                 SizedBox(height: 20.0),
                 TextFormField(
                   decoration: textInputDecoration.copyWith(hintText: 'Email'),

                   validator: (val) {
                    if (val.isEmpty){
                      return 'Please enter an email';
                    }
                   },                            
                   onChanged: (val){
                     setState(() => email = val);
                   },
                 ),
                 SizedBox(height:20),
                 TextFormField(
                   decoration: textInputDecoration.copyWith(hintText: 'Password'),
                   validator: (val) => val.length < 6 ? 'Enter a valid password':null,
                   obscureText: true,
                   onChanged: (val){
                     setState(() => password = val);
                   },
                 ),
                 SizedBox(height:20),
                 RaisedButton(
                   color: Colors.blueGrey[200],
                   child: Text(
                     'Register',
                     style:TextStyle(color:Colors.white),
                   ),
                   onPressed: () async {
                     if (_formKey.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      
                      dynamic result = await _auth.signUpWithEmailAndPassword(email, password);
                      if (result == null){
                      setState(() {
                         error= 'please provide valid data';
                         loading = false;
                      });
                     }
                   }
                   }
                   ),

                   SizedBox(height: 12),
                   Text(
                     error,
                     style:TextStyle(color:Colors.red, fontSize: 12)
                   )
               ],
             ))
         ),
    );
  }
}
