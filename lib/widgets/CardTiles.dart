import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:restaurant_app/data/provider/FavoriteProvider.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';

class CardTiles extends StatefulWidget {
  final Restaurant restaurantInfo;

  const CardTiles({required this.restaurantInfo});

  @override
  _CardTilesState createState() => _CardTilesState();
}

class _CardTilesState extends State<CardTiles> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: widget.restaurantInfo.id,
        child: CachedNetworkImage(
          imageUrl: "https://restaurant-api.dicoding.dev/images/medium/" +
              widget.restaurantInfo.pictureId.toString(),
          errorWidget: (context, url, error) => Container(
            child: Text("Gambar gagal Dapat Dimuat!"),
          ),
          imageBuilder: (context, imageProvide) => Material(
            color: Theme.of(context).backgroundColor,
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.75), BlendMode.dstATop),
                    image: imageProvide),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () async {
                  bool status = await Provider.of<RestaurantProvider>(context,
                          listen: false)
                      .getDetailRestaurant(context, widget.restaurantInfo.id);
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
                          widget.restaurantInfo.name,
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
                              widget.restaurantInfo.city,
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
                              widget.restaurantInfo.rating,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Expanded(
                            child: Consumer<FavoriteProvider>(
                              builder: (context, values, child) => Icon(
                                  values.restaurantList.any((element) {
                                    return element.id ==
                                            widget.restaurantInfo.id
                                        ? true
                                        : false;
                                  })
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.red.shade300),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
