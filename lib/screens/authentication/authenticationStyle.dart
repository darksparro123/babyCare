import 'package:babycare/widgets/mainWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationStyles {
  MainWidgets mainWidgets = MainWidgets();
  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
      gradient: mainWidgets.linearGradient(
        Colors.pink,
        Colors.red,
      ),
    );
  }

  BoxDecoration centerContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
    );
  }

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

  BoxDecoration signButton() {
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
