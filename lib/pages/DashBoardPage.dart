import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/RestaurantListPage.dart';

class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: RestaurantListPage(),
    );
  }
}
