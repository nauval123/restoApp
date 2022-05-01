import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/CustomDIalog.dart';
import 'package:restaurant_app/common/PlatformWiget.dart';
import 'package:restaurant_app/data/provider/SchedulingProvider.dart';
import 'package:restaurant_app/widgets/dialogs.dart';

class SettingsPage extends StatefulWidget {
  static const String settingsTitle = 'Settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _buildAndroid(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: _buildList(context),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          color: Theme.of(context).backgroundColor,
          child: ListTile(
            title: Text(
              'Scheduling Restaurant',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Consumer<SchedulingProvider>(
              builder: (context, scheduled, _) {
                // if (scheduled.isScheduled == true) {
                //   scheduled.scheduledNews(scheduled.isScheduled);
                // }
                return Switch.adaptive(
                  value: scheduled.isScheduled,
                  onChanged: (value) async {
                    if (Platform.isIOS) {
                      showSingleActionDialog(context,
                          titleText: "Pesan",
                          contentText: "Belum Tersedia untuk IOS",
                          actionOnPressed: () => Navigator.pop(context));
                    } else {
                      scheduled.scheduledNews(value);
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
