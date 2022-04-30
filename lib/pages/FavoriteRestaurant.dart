import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/size.dart';
import 'package:restaurant_app/common/sizebox.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/provider/FavoriteProvider.dart';
import 'package:restaurant_app/widgets/CardTiles.dart';

class FavoriteRestaurantPage extends StatefulWidget {
  const FavoriteRestaurantPage({Key? key}) : super(key: key);

  @override
  State<FavoriteRestaurantPage> createState() => _FavoriteRestaurantPageState();
}

class _FavoriteRestaurantPageState extends State<FavoriteRestaurantPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<FavoriteProvider>();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<FavoriteProvider>(
        builder: (context, value, child) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: displayWidth(context),
              height: displayHeight(context),
              padding: EdgeInsets.only(
                  bottom: displayHalfHeight(context, number: 0.05)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: value.restaurantList.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Verticals(
                                    displayHalfHeight(context, number: 0.15)),
                                Text(
                                  'Tidak Ada Restorang yang Kamu Favoritkan',
                                ),
                              ])
                        : ListView.builder(
                            itemCount: value.restaurantList.length,
                            itemBuilder: (context, index) {
                              return CardTiles(
                                restaurantInfo: value.restaurantList[index],
                              );
                            },
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
