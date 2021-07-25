import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/AboutUsPage.dart';
import 'package:restaurant_app/pages/RestaurantListPage.dart';

class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _indexList=0;

  List<Widget> _pagebaseNavigation = [
    RestaurantListPage(),
    AboutUsPage(),
  ];

  List <BottomNavigationBarItem> _bottomNavigationItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: "Home",
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "About Us",
      ),
  ];

  void _onTapNavbarItem (int indexListNavbar){
    setState(() {
          _indexList=indexListNavbar;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pagebaseNavigation[_indexList],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _indexList,
        selectedItemColor: Colors.yellow[600],
        items: _bottomNavigationItem,
        onTap: _onTapNavbarItem,
      ) ,
    );
  }
}



// Widget N