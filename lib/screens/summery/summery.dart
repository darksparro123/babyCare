import 'package:babycare/screens/home/homeWidgets.dart';
import 'package:babycare/screens/summery/summeryWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summery extends StatefulWidget {
  _SummeryState createState() => _SummeryState();
}

class _SummeryState extends State<Summery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Summary"),
          centerTitle: true,
          backgroundColor: Colors.pink[500],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(
                  "Peed Table",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      backgroundColor: Colors.amber[200],
                      color: Colors.purple,
                      fontSize: MediaQuery.of(context).size.width / 10.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SummeryWidgets(
                  collectionPath: "Peed Table",
                ),
                Text(
                  "Feed Table",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      backgroundColor: Colors.amber[200],
                      color: Colors.purple,
                      fontSize: MediaQuery.of(context).size.width / 10.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SummeryWidgets(
                  collectionPath: "Feed Table",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
