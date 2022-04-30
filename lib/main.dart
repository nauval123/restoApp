import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/provider/FavoriteProvider.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/data/provider/RestaurantSearchProvider.dart';
import 'package:restaurant_app/data/provider/SchedulingProvider.dart';
import 'package:restaurant_app/data/services/BackgroundService.dart';
// import 'package:restaurant_app/data/model/LocalRestaurant.dart';
import 'package:restaurant_app/pages/DashBoardPage.dart';
import 'package:restaurant_app/pages/DetailRestaurantPage.dart';
import 'package:restaurant_app/pages/FavoriteRestaurant.dart';
import 'package:restaurant_app/pages/SearchRestaurantPage.dart';
import 'package:restaurant_app/pages/SettingsPage.dart';
import 'package:restaurant_app/pages/SplashScreenPage.dart';

import 'data/services/NotificationHerlper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

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
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
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
          '/Favorit': (context) => FavoriteRestaurantPage(),
          '/Settings': (context) => SettingsPage(),
        },
      ),
    );
  }
}
