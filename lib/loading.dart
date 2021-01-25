import 'dart:async';

import 'package:babycare/screens/home/home.dart';
import 'package:babycare/screens/navBar/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  var routes = "Home";
  void initState() {
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[500],
      body: Center(
          child: SpinKitFadingCube(
        color: Colors.red,
        size: 90,
      )),
    );
  }
}
