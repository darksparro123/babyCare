import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummeryWidgets extends StatefulWidget {
  final String collectionPath;
  SummeryWidgets({this.collectionPath});
  @override
  SummerWidgetsState createState() {
    // TODO: implement createState
    return SummerWidgetsState(collectionPath: collectionPath);
  }
}

class SummerWidgetsState extends State<SummeryWidgets> {
  String buttonName = "Feed";
  String collectionPath;
  String babysName;
  SummerWidgetsState({this.collectionPath});

  getBabysName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      babysName = prefs.getString("babysName");
    });
  }

  @override
  void initState() {
    getBabysName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Baby's Details")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection(babysName)
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection(collectionPath)
            .orderBy(
              "time",
              descending: true,
            )
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if ((!snapshot.hasData) | (babysName == null)) {
            return Center(
                child: SpinKitChasingDots(
              color: Colors.amber[500],
              size: 100.0,
            ));
          }
          return ListView(
            shrinkWrap: true,
            children: snapshot.data.docs.map((document) {
              //print(document.data()["displayTime"]);
              return Container(
                alignment: Alignment.center,
                child: Text(
                  "${document.data()["displayTimeWithYear"]}",
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 35.0,
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
