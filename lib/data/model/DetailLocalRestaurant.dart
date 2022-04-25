class DetailRestaurantModel {
  bool error;
  String message;
  Restaurants localrestaurant;

  DetailRestaurantModel({
    required this.error,
    required this.message,
    required this.localrestaurant,
  });

  factory DetailRestaurantModel.fromJson(
          Map<String, dynamic> listrestaurantInfo) =>
      DetailRestaurantModel(
        error: listrestaurantInfo['error'],
        message: listrestaurantInfo['message'],
        localrestaurant: Restaurants.fromJson(listrestaurantInfo['restaurant']),
      );
}

class Restaurants {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late List categories;
  late Menus menus;
  late List<CustomerReviews> customerReviews;
  String pictureBaseUrl = "https://restaurant-api.dicoding.dev/images/medium/";

  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
    required this.categories,
  });

  Restaurants.fromJson(Map<String, dynamic> detailrestaurantInfo) {
    id = detailrestaurantInfo["id"];
    name = detailrestaurantInfo["name"];
    description = detailrestaurantInfo["description"];
    pictureId = pictureBaseUrl + detailrestaurantInfo["pictureId"];
    city = detailrestaurantInfo["city"];
    rating = detailrestaurantInfo["rating"].toString();
    categories = detailrestaurantInfo['categories'];
    menus = Menus.fromJson(detailrestaurantInfo['menus']);
    customerReviews = List<CustomerReviews>.from(
        detailrestaurantInfo["customerReviews"]
            .map((x) => CustomerReviews.fromJson(x)));
  }
}

class Menus {
  late List<Food> food;
  late List<Drink> drink;

  Menus({
    required this.food,
    required this.drink,
  });

  Menus.fromJson(Map<String, dynamic> json) {
    var listfoods = json["foods"] as List;
    List<Food> foods = listfoods.map((i) => Food.fromJson(i)).toList();
    var listdrinks = json["drinks"] as List;
    List<Drink> drinks = listdrinks.map((i) => Drink.fromJson(i)).toList();
    food = foods;
    drink = drinks;
  }
}

parsingDataDetail(Map<String, dynamic> map) {
  if (map.isEmpty) {
    return [];
  }
  return DetailRestaurantModel.fromJson(map);
}

class Food {
  late String name;

  Food({
    required this.name,
  });

  Food.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}

class Drink {
  late String name;

  Drink({
    required this.name,
  });

  Drink.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}

class CustomerReviews {
  late String name;
  late String review;
  late String date;

  CustomerReviews({
    required this.name,
    required this.review,
    required this.date,
  });

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    review = json["review"];
    date = json["date"];
  }
}
