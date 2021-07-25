import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/LocalRestaurant.dart';
import 'package:restaurant_app/widgets/CardTile.dart';

class RestaurantListPage extends StatefulWidget {

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  final snackbarNotification  =  SnackBar(content: Text("Error! cannot show restaurant list") ,duration: Duration(seconds: 3),);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text("ListPage dashboard"),
    // );
    return FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<LocalRestaurant> listRestaurant = parsingData(snapshot.data);
          if(snapshot.hasError){
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(snackbarNotification);
                        }); 
          }
          else if(snapshot.hasData){
            return ListView.builder(
            itemCount: listRestaurant.length,
            itemBuilder: (context, index) {
              // print(listRestaurant[index]);
              return CardTile(restaurantInfo: listRestaurant[index]);
            },
          );
          }
          return Text("data");
        },
      );
  }
}