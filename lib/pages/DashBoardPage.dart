import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/pages/RestaurantListPage.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<RestaurantProvider>(context, listen: false)
          .getListofRestaurant(context);
    });
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.search, color: Colors.white),
        onPressed: () => Navigator.pushNamed(context, '/Search'),
      ),
    );
  }
}
