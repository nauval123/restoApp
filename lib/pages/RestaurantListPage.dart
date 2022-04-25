import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/size.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/widgets/CardTiles.dart';

class RestaurantListPage extends StatefulWidget {
  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Consumer<RestaurantProvider>(
          builder: (context, value, child) => Container(
            width: displayHalfWidth(context, number: 1),
            height: displayHalfHeight(context, number: 1),
            padding: EdgeInsets.all(10),
            child: value.listRestauranState == Status.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: value.listofRestaurant.length,
                    itemBuilder: (context, index) => CardTiles(
                        restaurantInfo: value.listofRestaurant[index]),
                  ),
          ),
        ),
      ),
    );
  }
}
