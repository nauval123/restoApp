// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..forward();
    _animation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(_controller);
    beginSplash();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  beginSplash() async {
    var duration = const Duration(seconds: 4);
    // _fade=!_fade;
    return Timer(duration, () {
      setState(() {
        Navigator.pushReplacementNamed(context, '/Dashboard');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
          child: Hero(
        tag: "heroLogo",
        child: FadeTransition(
          opacity: _animation,
          child: Center(
              child: Text(
            'Yuk Makan',
            style: Theme.of(context).textTheme.headline3,
          )),
        ),
      )),
    );
  }
}
