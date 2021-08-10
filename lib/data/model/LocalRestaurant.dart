import 'dart:convert';

class ListLocalRestaurant {
   bool error;
   String message;
   int count;
  LocalRestaurant localrestaurant;

  ListLocalRestaurant({
    required this.error,
    required this.message,
    required this.count,
    required this.localrestaurant,
  });

  factory ListLocalRestaurant.fromJson(Map<String,dynamic> listrestaurantInfo) => ListLocalRestaurant(
    error: listrestaurantInfo['error'], 
    message: listrestaurantInfo['message'], 
    count: listrestaurantInfo['count'], 
    localrestaurant: listrestaurantInfo['restaurants'],
    );

}

class LocalRestaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
   String pictureBaseUrl= "https://restaurant-api.dicoding.dev/images/medium/";
  // late Menus menus;
  
  LocalRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    // required this.menus,
  });

  LocalRestaurant.fromJson(Map<String,dynamic> restaurantInfo){
   id = restaurantInfo["id"];
   name = restaurantInfo["name"]; 
   description = restaurantInfo["description"];
   pictureId = pictureBaseUrl + restaurantInfo["pictureId"];
   city = restaurantInfo["city"];
   rating = restaurantInfo["rating"].toString() ;
  //  menus =  Menus.fromJson(restaurantInfo['menus']);
  }
}

// class Menus {
//   late List <Food> food;
//   late List <Drink> drink;

//   Menus({
//     required this.food,
//     required this.drink,
//   });

//    Menus.fromJson(Map<String,dynamic> json){
//     var listfoods = json["foods"] as List;
//      List<Food> foods = listfoods.map((i) => Food.fromJson(i)).toList();
//      var listdrinks = json["drinks"] as List;
//      List<Drink> drinks = listdrinks.map((i) => Drink.fromJson(i)).toList();
//      food = foods;
//      drink = drinks;
//   }
     
// }

List<ListLocalRestaurant> parsingData(String? json){
    if (json == null) {
  return [];
}
  Map <String,dynamic> map = jsonDecode(json);
  final List parsed = map['restaurants'];
  return parsed.map((json) => ListLocalRestaurant.fromJson(json)).toList();
}

// class Food {
//   late String name;

//   Food({
//     required this.name,
//   });

//   Food.fromJson(Map <String,dynamic> json){
//     name= json["name"];
//   }

// }

// class Drink {
//   late String name;

//   Drink({
//     required this.name,
//   });

//   Drink.fromJson(Map<String,dynamic> json){
//     name= json["name"];
//   }
// }

// class CustomerReview{

// }