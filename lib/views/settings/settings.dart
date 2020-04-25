import 'package:flutter/material.dart';
import 'package:covid19_production_app/shared/loading.dart';
import 'package:covid19_production_app/models/user.dart';
import 'package:covid19_production_app/shared/constants.dart';
import 'package:easy_localization/easy_localization.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title').tr(),
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Form(
            
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your coffe settings.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.redAccent,
                child: Text(
                  'Update',
                  style: TextStyle(color:Colors.white),
                ),
                onPressed: () async{
                  if (_formKey.currentState.validate())
                  {
                    Navigator.pop(context);

                  }
                },
              )
            ],
          ),
          
        )
    );     
  }
}

