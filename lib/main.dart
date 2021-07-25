import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/pages/DashBoardPage.dart';
import 'package:restaurant_app/pages/DetailRestaurantPage.dart';
import 'package:restaurant_app/pages/SplashScreenPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(textTheme: textTheme),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen':(context)=>SplashScreen(),
        '/Dashboard':(context)=>Dashboard(),
        '/DetailRestaurant':(context)=>DetailRestaurant(),
      },
    );
  }
}