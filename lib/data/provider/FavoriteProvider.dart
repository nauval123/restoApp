import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:restaurant_app/data/services/DatabaseHelper.dart';
import 'package:restaurant_app/widgets/dialogs.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Restaurant> _restaurantList = [];
  List<Restaurant> _searchResult = [];
  late DatabaseHelper _dbHelper;
  Status favoriteState = Status.loading;

  List<Restaurant> get restaurantList => _restaurantList;
  List<Restaurant> get searchResult => _searchResult;

  FavoriteProvider() {
    _dbHelper = DatabaseHelper();
    _getFavoriteList();
  }

  _getFavoriteList() async {
    // try {
    _restaurantList = await _dbHelper.getFavorite();
    if (_restaurantList.isEmpty) {
      favoriteState = Status.empty;
      notifyListeners();
    } else {
      favoriteState = Status.initialize;
      notifyListeners();
    }
    // } catch (e) {
    //   print(e);
    // }
  }

  favoriteRestaurant(BuildContext context, Restaurant data) async {
    // try {
    print('favoritkan restuarant');
    print(data.pictureId);
    await _dbHelper.favoriteRestaurant(data);
    _getFavoriteList();
    // } catch (e) {
    //   print(e);
    // }
  }

  unfavoriteRestaurant(BuildContext context, Restaurant data) async {
    // try {
    print("unfavorit kan restaurant");
    await _dbHelper.unfavoriteRestaurant(data.id);
    _getFavoriteList();
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<Restaurant> getFavoriteById(String id) async {
    return await _dbHelper.getFavoriteById(id);
  }

  // filterByName(BuildContext context, String word) {
  //   if (word.isEmpty) {
  //     showSingleActionDialog(
  //       context,
  //       titleText: "Peringatan",
  //       contentText: "Kata Kunci Kosong",
  //       actionOnPressed: () {
  //         Navigator.pop(context);
  //       },
  //     );
  //   } else {
  //     _searchResult = _restaurantList
  //         .where(
  //           (element) => element.name.toLowerCase().contains(
  //                 word.toLowerCase(),
  //               ),
  //         )
  //         .toList();
  //     notifyListeners();
  //   }
  // }
}
