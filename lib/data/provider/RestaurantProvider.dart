import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/common/status.dart';
import 'package:restaurant_app/data/model/DetailLocalRestaurant.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:restaurant_app/data/services/ApiHelper.dart';
import 'package:restaurant_app/widgets/dialogs.dart';

class RestaurantProvider extends ChangeNotifier {
  Status listRestauranState = Status.loading;
  Status detailRestaurantState = Status.loading;
  Status reviewPostState = Status.notInitialize;
  List<Restaurant> listofRestaurant = [];
  DetailRestaurantModel? detailRestaurant;

  getListofRestaurant(BuildContext context) async {
    print('getlist');
    APIHelper api = APIHelper(context);
    // try {
    Map<String, dynamic> apiResult =
        await api.api('/list', APIMethod.get, withPop: false);
    if (apiResult['error'] == false) {
      listofRestaurant = parsingToListRestaurant(apiResult);
      listRestauranState = Status.initialize;
    } else {
      listRestauranState = Status.notInitialize;
    }
    notifyListeners();
    // } catch (e) {}
  }

  getDetailRestaurant(BuildContext context, String idRestaurant) async {
    showLoadingDialog(context);
    APIHelper api = APIHelper(context);
    print('getdetail');
    try {
      Map<String, dynamic> apiResult = await api
          .api('/detail/' + idRestaurant, APIMethod.get, withPop: true);
      print(apiResult);
      if (apiResult['error'] == false) {
        detailRestaurant = parsingDataDetail(apiResult);
        detailRestaurantState = Status.initialize;
        notifyListeners();
        return true;
      } else {
        detailRestaurantState = Status.notInitialize;
        notifyListeners();
        return false;
      }
    } catch (e) {}
  }

  postReviewonRestaurant(BuildContext context, String idRestaurant, String name,
      String review) async {
    showLoadingDialog(context);
    APIHelper api = APIHelper(context);
    // try {
    Map<String, dynamic> parameter = {
      'id': idRestaurant,
      'name': name,
      'review': review
    };
    Map<String, dynamic> apiResult = await api.api('/review', APIMethod.post,
        withPop: true, parameters: parameter);
    print('ini hasilnya');
    print(apiResult);
    if (apiResult['error'] == false) {
      await getDetailRestaurant(context, idRestaurant);
    }
    Navigator.pop(context);
    // } catch (e) {}
  }
}
