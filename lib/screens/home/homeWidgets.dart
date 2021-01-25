import 'package:babycare/screens/home/homeStyles.dart';
import 'package:babycare/services/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeWidgets {
  HomeStyles homeStyles = HomeStyles();

  Container homeAppBar(context) {
    //String a = getBabyName();
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8,
        decoration: homeStyles.appBarDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.baby_changing_station,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 9.0,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BabyCare",
                    style: homeStyles.appBarTextStyle(
                      Colors.white,
                      MediaQuery.of(context).size.height / 29,
                      FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Time Now: ${DateTime.now().toString().substring(10, 16)}",
                    style: homeStyles.appBarTextStyle(
                      Colors.white,
                      MediaQuery.of(context).size.height / 29,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }

  Container buttonRow(context, String babysName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buttons(context, "Feed", babysName),
            buttons(context, "Peed", babysName),
            buttons(context, "Poop", babysName),
            buttons(context, "Sleep", babysName),
          ],
        ),
      ),
    );
  }

  Information information = Information();
  InkWell buttons(context, String buttonName, String babysName) {
    return InkWell(
      onTap: () async {
        print(buttonName);
        print(babysName);
        if (buttonName == "Peed") {
          await information.peedTable(babysName, DateTime.now(),
              DateTime.now().toString().substring(10, 16));
          await information.displayTable(buttonName, DateTime.now());
        }
        if (buttonName == "Feed") {
          await information.feedTable(babysName, DateTime.now(),
              DateTime.now().toString().substring(10, 16));
          await information.displayTable(buttonName, DateTime.now());
        }
        if (buttonName == "Poop") {
          await information.poodTable(babysName, DateTime.now(),
              DateTime.now().toString().substring(10, 16));
          await information.displayTable(buttonName, DateTime.now());
        }
        if (buttonName == "Sleep") {
          await information.sleepTable(babysName, DateTime.now(),
              DateTime.now().toString().substring(10, 16));
          await information.displayTable(buttonName, DateTime.now());
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height / 10.0,
        decoration: homeStyles.buttonRowDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonName,
            textAlign: TextAlign.center,
            style: homeStyles.buttonRowTextStyles(context),
          ),
        ),
      ),
    );
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Widget streamPannel(
      String collectionName, String babysName, String tableName, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11.0),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Baby's Details")
              .doc(firebaseAuth.currentUser.uid)
              .collection(babysName)
              .doc(firebaseAuth.currentUser.uid)
              .collection(collectionName)
              .orderBy("time", descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {}
            return ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: snapshot.data.docs.map((document) {
                return Container(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 55.0,
                    child: Card(
                        elevation: 5,
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(9.5),
                          child: Text(
                            "$tableName : ${document.data()["displayTime"]}",
                            textAlign: TextAlign.center,
                            style: homeStyles.buttonRowTextStyles(context),
                          ),
                        )),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Container showButtonRow(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showButtons(
              context,
              "Feed Summary",
            ),
            showButtons(
              context,
              "Peed Summary",
            ),
            showButtons(
              context,
              "Pood Summary",
            ),
            showButtons(
              context,
              "Sleep Summary",
            ),
          ],
        ),
      ),
    );
  }

  InkWell showButtons(context, String buttonName) {
    return InkWell(
      onTap: () async {
        if (buttonName == "Peed") {}
        if (buttonName == "Feed") {}
        if (buttonName == "Poop") {}
        if (buttonName == "Sleep") {}
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height / 10.0,
        decoration: homeStyles.buttonRowDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonName,
            textAlign: TextAlign.center,
            style: homeStyles.showButtonRowTextStyles(),
          ),
        ),
      ),
    );
  }

  Widget homePageStream(context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Display Table")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection("Display")
          .orderBy("time", descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SpinKitChasingDots(
              color: Colors.pink,
              size: 50.0,
            ),
          );
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            children: snapshot.data.docs.map((document) {
              //print(document.data()["displayTable"].toString().substring(0, 1));
              return Container(
                child: ListTile(
                  leading: Container(
                    width: 55,
                    height: 55,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.amber[200],
                      child: Container(
                        child: Image.asset(
                          (document
                                      .data()["displayTable"]
                                      .toString()
                                      .substring(0, 1) ==
                                  "F")
                              ? "assets/feeding.png"
                              : (document
                                          .data()["displayTable"]
                                          .toString()
                                          .substring(0, 1) ==
                                      "S")
                                  ? "assets/sleeping.png"
                                  : (document
                                              .data()["displayTable"]
                                              .toString()
                                              .substring(0, 2) ==
                                          "Po")
                                      ? "assets/poop.png"
                                      : "assets/poop.png",
                          width: 48,
                          height: 48,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    document.data()["displayTable"],
                    textAlign: TextAlign.start,
                    style: homeStyles.textStyle(context),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
