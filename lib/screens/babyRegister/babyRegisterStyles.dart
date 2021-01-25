import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BabyRegisteStyles {
  InputDecoration inputFieldDecoration(String hintText, String labelText) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: formFieldTextStyle(),
      hintStyle: formFieldTextStyle(),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white, width: 5.0),
      ),
    );
  }

  TextStyle formFieldTextStyle() {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: Colors.pink[500],
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  BoxDecoration submitButton() {
    return BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(25.0),
    );
  }

  TextStyle buttonText() {
    return GoogleFonts.ubuntu(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
