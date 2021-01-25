import 'package:babycare/widgets/mainWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStyles {
  MainWidgets mainWidgets = MainWidgets();
  BoxDecoration appBarDecoration() {
    return BoxDecoration(
      gradient: mainWidgets.linearGradient(Colors.pink, Colors.red),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(60.0),
      ),
    );
  }

  TextStyle appBarTextStyle(Color color, double size, FontWeight fontWeight) {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }

  BoxDecoration buttonRowDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      gradient: mainWidgets.linearGradient(
        Colors.indigo,
        Colors.pink[500],
      ),
    );
  }

  TextStyle buttonRowTextStyles(context) {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width / 23,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextStyle showButtonRowTextStyles() {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextStyle textStyle(context) {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: Colors.lightBlue,
        fontSize: MediaQuery.of(context).size.width / 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
