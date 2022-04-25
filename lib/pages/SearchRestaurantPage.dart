import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/size.dart';
import 'package:restaurant_app/common/sizebox.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/provider/RestaurantSearchProvider.dart';
import 'package:restaurant_app/widgets/CardTiles.dart';
import 'package:restaurant_app/widgets/dialogs.dart';

class SearchRestaurantPage extends StatefulWidget {
  const SearchRestaurantPage({Key? key}) : super(key: key);

  @override
  State<SearchRestaurantPage> createState() => _SearchRestaurantPageState();
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  final TextEditingController _keyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Consumer<RestaurantSearchProvider>(
          builder: (context, value, child) => SingleChildScrollView(
            child: WillPopScope(
              onWillPop: () async {
                showLoadingDialog(context);
                await value.setSearchState();
                Navigator.pop(context);
                return true;
              },
              child: Container(
                width: displayWidth(context),
                height: displayHeight(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      width: displayWidth(context),
                      child: TextFormField(
                        controller: _keyword,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Cari Restoran',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).backgroundColor,
                          suffixIcon: IconButton(
                            onPressed: _keyword.text.isEmpty
                                ? () {
                                    showSingleActionDialog(
                                      context,
                                      titleText: "Pesan",
                                      contentText:
                                          "Kata kunci tidak Boleh Kosong!",
                                      actionOnPressed: () =>
                                          Navigator.pop(context),
                                    );
                                  }
                                : () async {
                                    await value.setSearchState();
                                    await value.searchRestaurant(
                                        context, _keyword.text);
                                  },
                            icon: Icon(
                              Icons.search,
                              color: _keyword.text.isEmpty
                                  ? Colors.yellow.shade400
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: value.searchestauranState == Status.loading
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Verticals(
                                      displayHalfHeight(context, number: 0.15)),
                                  Icon(
                                    Icons.manage_search,
                                    size:
                                        displayHalfWidth(context, number: 0.5),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    'Cari Restaurant yang Kamu Inginkan',
                                  ),
                                ])
                          : value.searchestauranState == Status.empty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                      Verticals(displayHalfHeight(context,
                                          number: 0.15)),
                                      Icon(
                                        Icons.search_off,
                                        size: displayHalfWidth(context,
                                            number: 0.5),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Text(
                                        'Data Tidak Ditemukan',
                                      ),
                                    ])
                              : ListView.builder(
                                  itemCount:
                                      value.listSearchOfRestaurant.length,
                                  itemBuilder: (context, index) => CardTiles(
                                      restaurantInfo:
                                          value.listSearchOfRestaurant[index]),
                                ),
                    )
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
