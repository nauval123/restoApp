class ListLocalRestaurant {
  bool error;
  String message;
  int count;
  List localrestaurant;

  ListLocalRestaurant({
    required this.error,
    required this.message,
    required this.count,
    required this.localrestaurant,
  });

  factory ListLocalRestaurant.fromJson(
          Map<String, dynamic> listrestaurantInfo) =>
      ListLocalRestaurant(
        error: listrestaurantInfo['error'],
        message: listrestaurantInfo['message'],
        count: listrestaurantInfo['count'],
        localrestaurant: listrestaurantInfo['restaurants'],
      );
}
