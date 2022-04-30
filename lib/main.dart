import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/provider/FavoriteProvider.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/data/provider/RestaurantSearchProvider.dart';
// import 'package:restaurant_app/data/model/LocalRestaurant.dart';
import 'package:restaurant_app/pages/DashBoardPage.dart';
import 'package:restaurant_app/pages/DetailRestaurantPage.dart';
import 'package:restaurant_app/pages/FavoriteRestaurant.dart';
import 'package:restaurant_app/pages/SearchRestaurantPage.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantSearchProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: textTheme,
          backgroundColor: Colors.grey.shade800,
          primaryColor: Colors.yellow.shade800,
        ),
        initialRoute: '/SplashScreen',
        routes: {
          '/SplashScreen': (context) => SplashScreen(),
          '/Dashboard': (context) => Dashboard(),
          '/DetailRestaurant': (context) => DetailRestaurant(),
          '/Search': (context) => SearchRestaurantPage(),
          '/Favorit': (context) => FavoriteRestaurantPage()
        },
      ),
    );
  }
}
