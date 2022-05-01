import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/size.dart';
import 'package:restaurant_app/common/sizebox.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/provider/FavoriteProvider.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/data/services/NotificationHerlper.dart';
import 'package:restaurant_app/pages/RestaurantListPage.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/Dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(Dashboard.routeName);
    Future.delayed(Duration.zero, () {
      Provider.of<RestaurantProvider>(context, listen: false)
          .getListofRestaurant(context);
      Provider.of<FavoriteProvider>(context, listen: false);
    });
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<RestaurantProvider>(
        builder: (context, value, child) =>
            value.listRestauranState == Status.initialize
                ? RestaurantListPage()
                : Container(
                    child: Center(
                      child: (CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )),
                    ),
                  ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'search',
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.search, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/Search'),
          ),
          Verticals(20),
          FloatingActionButton(
            heroTag: 'settings',
            backgroundColor: Colors.yellow.shade900,
            child: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/Settings');
            },
          ),
          Verticals(20),
          FloatingActionButton(
            heroTag: 'favorite',
            backgroundColor: Colors.yellow.shade900,
            child: Icon(Icons.star, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/Favorit');
            },
          ),
          Verticals(displayHalfHeight(context, number: 0.125)),
        ],
      ),
    );
  }
}
