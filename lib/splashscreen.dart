import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream_prediction/ShowNotification.dart';
import 'package:my_dream_prediction/myNavigationBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyNavigationBar()))); //MyNavigationBar()
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Image(image: AssetImage('assets/icon/dtplogo.png')));
  }
}
