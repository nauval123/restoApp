import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';

class CardTiles extends StatefulWidget {
  final Restaurant restaurantInfo;

  const CardTiles({required this.restaurantInfo});

  @override
  _CardTilesState createState() => _CardTilesState(this.restaurantInfo);
}

class _CardTilesState extends State<CardTiles> {
  final Restaurant restaurantInfo;

  _CardTilesState(this.restaurantInfo);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: restaurantInfo.id,
        child: CachedNetworkImage(
          imageUrl: restaurantInfo.pictureId,
          errorWidget: (context, url, error) => AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text("Gambar gagal Dapat Dimuat!"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          ),
          imageBuilder: (context, imageProvide) => Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.75), BlendMode.dstATop),
                image: NetworkImage(
                  restaurantInfo.pictureId,
                ),
              ),
            ),
            margin: EdgeInsets.all(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                bool status = await Provider.of<RestaurantProvider>(context,
                        listen: false)
                    .getDetailRestaurant(context, restaurantInfo.id);
                if (status) {
                  Navigator.pushNamed(context, '/DetailRestaurant');
                }
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 90,
                    ),
                    Expanded(
                      child: Text(
                        restaurantInfo.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.location_city,
                              color: Colors.red[800],
                            )),
                        Expanded(
                          flex: 5,
                          child: Text(
                            restaurantInfo.city,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            restaurantInfo.rating,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            margin: EdgeInsets.all(20),
            width: 20,
            height: 30,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ));
  }
}
