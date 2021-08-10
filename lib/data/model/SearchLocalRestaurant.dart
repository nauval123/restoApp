import 'dart:convert';

class SearchLocalRestaurant {
   bool error;
   int founded;
  LocalRestaurant localrestaurant;

  SearchLocalRestaurant({
    required this.error,
    required this.founded,
    required this.localrestaurant,
  });

  factory SearchLocalRestaurant.fromJson(Map<String,dynamic> searchrestaurantInfo) => SearchLocalRestaurant(
    error: searchrestaurantInfo['error'], 
    founded: searchrestaurantInfo['founded'], 
    localrestaurant: searchrestaurantInfo['restaurants'],
    );

}

class LocalRestaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  String pictureBaseUrl="https://restaurant-api.dicoding.dev/images/medium/";
  
  LocalRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  LocalRestaurant.fromJson(Map<String,dynamic> restaurantInfo){
   id = restaurantInfo["id"];
   name = restaurantInfo["name"]; 
   description = restaurantInfo["description"];
   pictureId = pictureBaseUrl + restaurantInfo["pictureId"];
   city = restaurantInfo["city"];
   rating = restaurantInfo["rating"].toString() ;
  }
}

List<SearchLocalRestaurant> parsingDataSearch(String? json){
    if (json == null) {
  return [];
}
  Map <String,dynamic> map = jsonDecode(json);
  final List parsed = map['restaurants'];
  return parsed.map((json) => SearchLocalRestaurant.fromJson(json)).toList();
}