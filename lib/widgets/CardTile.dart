
import 'package:flutter/material.dart';

import 'package:restaurant_app/data/model/LocalRestaurant.dart';

class CardTile extends StatelessWidget {
  final LocalRestaurant restaurantInfo;

  const CardTile({required this.restaurantInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: restaurantInfo.pictureId, 
        child: Image.network(restaurantInfo.pictureId)
        ),
      title: Text(restaurantInfo.name),
      subtitle: Text(restaurantInfo.city),
    );
  }
}
