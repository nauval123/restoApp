import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/widgets/dialogs.dart';

enum APIMethod {
  post,
  put,
  get,
  delete,
}

class APIHelper {
  late BuildContext context;

  APIHelper(this.context,
      {this.baseUrl = "restaurant-api.dicoding.dev", this.flushbar = false});
  String baseUrl;
  bool flushbar;

  Future<Map<String, dynamic>> api(
    String path,
    APIMethod method, {
    Map<String, dynamic>? parameters,
    String? token,
    bool withPop = false,
    bool withDefaultErrorDialog = true,
  }) async {
    try {
      print(parameters);
      print(json.encode(parameters));
      late http.Response response;
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      if (method == APIMethod.get) {
        response = await http.get(
          Uri.http(baseUrl, path, parameters),
          headers: headers,
        );
      } else if (method == APIMethod.post) {
        response = await http.post(
          Uri.parse("https://" + baseUrl + path),
          headers: {"Content-Type": "application/json"},
          body: json.encode(parameters),
        );
      } else if (method == APIMethod.put) {
        response = await http.put(
          Uri.http(baseUrl, path),
          headers: headers,
          body: json.encode(parameters),
        );
      } else if (method == APIMethod.delete) {
        response = await http.delete(
          Uri.http(baseUrl, path),
          headers: headers,
          body: json.encode(parameters),
        );
      }

      Map<String, dynamic> receivedData = json.decode(response.body);
      print(response.statusCode);
      if (receivedData['error'] == true ||
          response.statusCode == 500 ||
          response.statusCode == 404) {
        if (withPop) Navigator.pop(context);
        showSingleActionDialog(
          context,
          titleText: response.statusCode.toString(),
          contentText: receivedData['message'],
          actionOnPressed: () => Navigator.pop(context),
        );
        return {
          "result": false,
          "empty": (response.statusCode == 404 ? true : false),
        };
      } else {
        if (withPop) Navigator.pop(context);
        return receivedData;
      }
    } on SocketException catch (e) {
      if (withPop) Navigator.pop(context);

      showSingleActionDialog(
        context,
        titleText: 'Tidak ada koneksi',
        contentText:
            'Tidak dapat menjangkau server, pastikan terdapat koneksi internet.\n\n${e.message}',
        actionOnPressed: () => Navigator.pop(context),
      );

      return {'result': false, "empty": e.message};
    } on FormatException catch (e) {
      if (withPop) Navigator.pop(context);

      showSingleActionDialog(
        context,
        titleText: 'Pesan',
        contentText: 'Terjadi Kesalahan :' + e.message,
        actionOnPressed: () => Navigator.pop(context),
      );

      return {'result': false, "empty": e.message};
    }
  }
}
