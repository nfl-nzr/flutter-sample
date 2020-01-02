import 'package:cukbuk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:cukbuk/utils/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeal',
      debugShowCheckedModeBanner: false,
      initialRoute: loadingScreenRoute,
      routes: Router(context: context).getRoutes(),
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.white, textTheme: TextTheme(
            body1: TextStyle(
              fontFamily: 'Quicksand'
            )
          )),
      home: Scaffold(
        body: SafeArea(
          child: Home(),
        ),
      ),
    );
  }
}
