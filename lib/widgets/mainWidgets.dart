import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidgets {
  LinearGradient linearGradient(Color color1, Color color2) {
    return LinearGradient(
      colors: [color1, color2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  TextStyle textSTyle(Color color, double size, FontWeight fontWeight,
      TextDecoration decoration) {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,

      ),
    );
  }
}
