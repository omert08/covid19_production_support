import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:covid19_production_app/models/user.dart';
import 'package:covid19_production_app/services/auth.dart';
import 'package:covid19_production_app/views/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(EasyLocalization(
    child:MyApp(),
    supportedLocales: [Locale('en', 'US'),Locale('tr','TR')],
    path: 'resources/langs',
    fallbackLocale: Locale('tr', 'TR'),

  )
  );
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(

        title: 'Covid19 Production Support App',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        home: Wrapper()
    )
    );
  }
}




