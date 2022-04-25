import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:restaurant_app/data/services/ApiHelper.dart';
import 'package:restaurant_app/widgets/dialogs.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  Status searchestauranState = Status.loading;
  List<Restaurant> listSearchOfRestaurant = [];

  setSearchState() {
    searchestauranState = Status.loading;
    notifyListeners();
  }

  searchRestaurant(BuildContext context, String searchKeyWord) async {
    APIHelper api = APIHelper(context);
    showLoadingDialog(context);
    try {
      listSearchOfRestaurant.clear();
      Map<String, dynamic> parameter = {'q': searchKeyWord};
      Map<String, dynamic> apiResult = await api.api('/search', APIMethod.get,
          withPop: true, parameters: parameter);
      print(apiResult);
      if (apiResult['error'] == false) {
        listSearchOfRestaurant = parsingToListRestaurant(apiResult);
        if (listSearchOfRestaurant.isEmpty) {
          searchestauranState = Status.empty;
        } else {
          searchestauranState = Status.initialize;
        }
      } else {
        searchestauranState = Status.notInitialize;
      }
      notifyListeners();
    } catch (e) {}
  }
}
