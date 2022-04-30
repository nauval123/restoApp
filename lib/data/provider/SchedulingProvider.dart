import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/services/BackgroundService.dart';
import 'package:restaurant_app/data/services/DateTimeHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchedulingProvider extends ChangeNotifier {
  SchedulingProvider() {
    getSettings();
  }
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  getSettings() async {
    SharedPreferences settings = await SharedPreferences.getInstance();
    _isScheduled = settings.getBool('notification') ?? false;
    notifyListeners();
  }

  scheduledNews(bool value) async {
    SharedPreferences settings = await SharedPreferences.getInstance();
    settings.setBool('notification', value);
    _isScheduled = value;

    if (_isScheduled) {
      print('activate');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('deactive notification');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
