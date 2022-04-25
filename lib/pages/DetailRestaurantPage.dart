import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/size.dart';
import 'package:restaurant_app/common/sizebox.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/widgets/dialogs.dart';

class DetailRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<RestaurantProvider>(
          builder: (context, value, child) => value.detailRestaurantState ==
                  Status.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        leading: Container(),
                        backgroundColor: Colors.yellow[800],
                        elevation: 0,
                        pinned: true,
                        expandedHeight: 250,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Hero(
                            tag: '',
                            child: Image.network(
                              value.detailRestaurant!.localrestaurant.pictureId,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Center(
                                  child: Text(
                                    "Gambar gagal Dapat Dmuat!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                          title: Text(
                            value.detailRestaurant!.localrestaurant.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                        ),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_city_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Text(
                                      value.detailRestaurant!.localrestaurant
                                          .city,
                                      textAlign: TextAlign.start,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 35,
                              ),
                              Text(value
                                  .detailRestaurant!.localrestaurant.rating),
                            ],
                          ),
                          Divider(
                            color: Colors.white38,
                            thickness: 1,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 5,
                              bottom: 10,
                              right: 5,
                              top: 20,
                            ),
                            child: Text(
                                value.detailRestaurant!.localrestaurant
                                    .description,
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          Divider(
                            color: Colors.white38,
                            thickness: 1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                left: 5, bottom: 10, right: 5, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Foods",
                                    textAlign: TextAlign.start,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.detailRestaurant!
                                          .localrestaurant.menus.food.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 10,
                                              right: 10,
                                              left: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.yellow[800],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Center(
                                              child: Row(
                                            children: [
                                              Icon(
                                                Icons.food_bank,
                                                color: Colors.white,
                                              ),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  value
                                                      .detailRestaurant!
                                                      .localrestaurant
                                                      .menus
                                                      .food[index]
                                                      .name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          )),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Drinks",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(5),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.detailRestaurant!
                                          .localrestaurant.menus.drink.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 10,
                                              right: 10,
                                              left: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.yellow[800],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.local_drink,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                value
                                                    .detailRestaurant!
                                                    .localrestaurant
                                                    .menus
                                                    .drink[index]
                                                    .name,
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Review",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    IconButton(
                                      onPressed: () {
                                        showDialogReview(
                                          context,
                                          id: value.detailRestaurant!
                                              .localrestaurant.id,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                Verticals(5),
                                Container(
                                  height:
                                      displayHalfHeight(context, number: 0.4),
                                  child: ListView.builder(
                                    itemCount: value.detailRestaurant!
                                        .localrestaurant.customerReviews.length,
                                    itemBuilder: (context, index) => Container(
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width: displayHalfWidth(
                                                        context,
                                                        number: 0.2),
                                                    child: Text(value
                                                        .detailRestaurant!
                                                        .localrestaurant
                                                        .customerReviews[index]
                                                        .name)),
                                                Expanded(
                                                  child: Text(
                                                    value
                                                        .detailRestaurant!
                                                        .localrestaurant
                                                        .customerReviews[index]
                                                        .date,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(value
                                                .detailRestaurant!
                                                .localrestaurant
                                                .customerReviews[index]
                                                .review)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Verticals(10),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
