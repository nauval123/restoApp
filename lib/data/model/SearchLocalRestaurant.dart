class SearchLocalRestaurant {
  bool error;
  int founded;
  List<Restaurant> localrestaurant;

  SearchLocalRestaurant({
    required this.error,
    required this.founded,
    required this.localrestaurant,
  });

  factory SearchLocalRestaurant.fromJson(
          Map<String, dynamic> searchrestaurantInfo) =>
      SearchLocalRestaurant(
        error: searchrestaurantInfo['error'],
        founded: searchrestaurantInfo['founded'],
        localrestaurant: searchrestaurantInfo['restaurants'],
      );
}

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  String pictureBaseUrl = "https://restaurant-api.dicoding.dev/images/medium/";

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurantInfo) {
    id = restaurantInfo["id"];
    name = restaurantInfo["name"];
    description = restaurantInfo["description"];
    pictureId = restaurantInfo["pictureId"];
    city = restaurantInfo["city"];
    rating = restaurantInfo["rating"].toString();
  }

  toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "pictureId": pictureId,
      "city": city,
      "rating": rating
    };
  }
}

parsingToListRestaurant(Map<String, dynamic> map) {
  if (map.isEmpty) {
    return [];
  }
  final List parsed = map['restaurants'];
  return parsed.map((element) => Restaurant.fromJson(element)).toList();
}
