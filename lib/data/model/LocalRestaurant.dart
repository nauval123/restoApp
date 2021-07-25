import 'dart:convert';

class LocalRestaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  // late List menus;
  
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
   pictureId = restaurantInfo["pictureId"];
   city = restaurantInfo["city"];
   rating =  restaurantInfo["rating"];
  //  menus =  restaurantInfo["menus"];
  }
}

  List<LocalRestaurant> parsingData(String? json){
     if (json == null) {
    return [];
  }
    final List <dynamic> parsed = jsonDecode(json);
    return parsed.map((json) => LocalRestaurant.fromJson(json)).toList();
  }