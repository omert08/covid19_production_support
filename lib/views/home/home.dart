import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:covid19_production_app/services/auth.dart';
import 'package:covid19_production_app/views/settings/settings.dart';

import '../campaigns/add_campaign.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _navigateToSettings(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsForm()));
  }
  Future _navigateToAddNewCampaign(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddCampaignView()));
  }

  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _signout = false;
  @override
  Widget build(BuildContext context) {
    return _signout
        ? _auth.SignOut()
        : Scaffold(
            key: _scaffoldKey,
            //backgroundColor: Colors.grey[50],
            drawer: _buildDrawer(_auth),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.menu),
                                  iconSize: 28.0,
                                  onPressed: () {
                                    _scaffoldKey.currentState.openDrawer();
                                  },
                                ),
                                SizedBox(width: 75),
                                Text('mainStream',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500))
                                    .tr(),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.search),
                                iconSize: 28.0,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.settings),
                                iconSize: 28.0,
                                onPressed: () {
                                  _navigateToSettings(context);
                                },
                              ),
                            ],
                          )
                        ]),
                  ),
                )
            ),

            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: (){
                // navigate to add campaign
                _navigateToAddNewCampaign(context);
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 32),
                ),
            ),
          );
  }
}

Drawer _buildDrawer(AuthService _auth) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.redAccent[100], Colors.redAccent[100]]),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'resources/img/profile.png',
                width: 80,
                height: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text("User Name", style: TextStyle(color: Colors.black)),
              SizedBox(
                height: 10,
              ),
              Text(
                "User Role",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),

        Column(
          children: <Widget>[
              ListTile(
              leading: Icon(Icons.person),
              title: Text('profile').tr(),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('search').tr(),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings.title').tr(),
              onTap: () {},
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.loyalty),
                    title: Text('buymeacoffe').tr(),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('signout').tr(),
                    onTap: () {
                      _auth.SignOut();
                    })
              ],
            )
          ],
        )
      ],
    ),
  );
}
