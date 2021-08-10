import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/DetailLocalRestaurant.dart';
import 'package:restaurant_app/data/model/LocalRestaurant.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';

class ApiService {
 static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
 static final String _list = 'list';
 static final String _detail = 'detail/:';
 static final String _search = 'search?q=';

//  static final String _apiKey = 'YOUR_API_KEY';
//  static final String _category = 'business';
//  static final String _country = 'id';
 
 Future<ListLocalRestaurant> listRestaurant() async {
   final url = Uri.parse(_baseUrl+_list);
   final response = await http.get(url);
   if(response.statusCode == 200){
     return ListLocalRestaurant.fromJson(jsonDecode(response.body));
   }else{
     throw Exception("Failed to load the list of restaurant!");
   }
 }

 Future<DetailLocalRestaurant> detailRestaurant(String id) async {
   final idrestaurant = id; 
   final url = Uri.parse(_baseUrl+_detail+idrestaurant);
   final response = await http.get(url);
   if(response.statusCode == 200){
     return DetailLocalRestaurant.fromJson(jsonDecode(response.body));
   }else{
     throw Exception("Failed to load the list of restaurant!");
   }
 }

 Future<SearchLocalRestaurant> searchRestaurant() async {
   final url = Uri.parse(_baseUrl+_search);
   final response = await http.get(url);
   if(response.statusCode == 200){
     return SearchLocalRestaurant.fromJson(jsonDecode(response.body));
   }else{
     throw Exception("Failed to load the list of restaurant!");
   }
 }


}