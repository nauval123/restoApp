import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';

void main() {
  test('parsing json', () {
    String data = """{
    "error": false,
    "message": "success",
    "count": 20,
    "restaurants": [
        {
            "id": "rqdv5juczeskfw1e867",
            "name": "Melting Pot",
            "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
            "pictureId": "14",
            "city": "Medan",
            "rating": 4.2
        },
        {
            "id": "s1knt6za9kkfw1e867",
            "name": "Kafe Kita",
            "description": "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
            "pictureId": "25",
            "city": "Gorontalo",
            "rating": 4
        }
    ]
}""";
    var map = json.decode(data);
    final List parsed = map['restaurants'];
    List<Restaurant> dataRestaurant =
        parsed.map((element) => Restaurant.fromJson(element)).toList();

    var get =
        dataRestaurant.where((element) => element.name == 'Kafe Kita').toList();
    var testing = get.first.name == 'Kafe Kita';
    expect(testing, true);
  });
}
