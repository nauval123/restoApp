import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/model/SearchLocalRestaurant.dart';
import 'package:restaurant_app/data/services/NotificationHerlper.dart';
import 'package:restaurant_app/main.dart';
import 'package:http/http.dart' as http;

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var result = await http
        .get(Uri.parse("https://restaurant-api.dicoding.dev/list"), headers: {
      "Content-Type": "application/json",
    });
    Map<String, dynamic> receivedData = json.decode(result.body);
    print("callbak");
    print(receivedData);
    List data = parsingToListRestaurant(receivedData);
    Random random = Random();
    int randomNumber = random.nextInt(data.length);
    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, data[randomNumber]);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
