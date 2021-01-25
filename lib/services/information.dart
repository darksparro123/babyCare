import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Information {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //getBabyDetails

  //peed
  Future<bool> peedTable(
      String babysName, DateTime dateTime, String displayTime) async {
    try {
      await firebaseFireStore
          .collection("Baby's Details")
          .doc(firebaseAuth.currentUser.uid)
          .collection(babysName)
          .doc(firebaseAuth.currentUser.uid)
          .collection("Peed Table")
          .doc()
          .set({
        "time": dateTime,
        "displayTime": displayTime,
        "displayTimeWithYear": dateTime.toString().substring(0, 16)
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //pood
  Future<bool> poodTable(
      String babysName, DateTime dateTime, String displayTime) async {
    try {
      await firebaseFireStore
          .collection("Baby's Details")
          .doc(firebaseAuth.currentUser.uid)
          .collection(babysName)
          .doc(firebaseAuth.currentUser.uid)
          .collection("Pood Table")
          .doc()
          .set({
        "time": dateTime,
        "displayTime": displayTime,
        "displayTimeWithYear": dateTime.toString().substring(0, 16)
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //feed
  Future<bool> feedTable(
      String babysName, DateTime dateTime, String displayTime) async {
    try {
      await firebaseFireStore
          .collection("Baby's Details")
          .doc(firebaseAuth.currentUser.uid)
          .collection(babysName)
          .doc(firebaseAuth.currentUser.uid)
          .collection("Feed Table")
          .doc()
          .set({
        "time": dateTime,
        "displayTime": displayTime,
        "displayTimeWithYear": dateTime.toString().substring(0, 16)
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //sleep
  Future<bool> sleepTable(
      String babysName, DateTime dateTime, String displayTime) async {
    try {
      await firebaseFireStore
          .collection("Baby's Details")
          .doc(firebaseAuth.currentUser.uid)
          .collection(babysName)
          .doc(firebaseAuth.currentUser.uid)
          .collection("Sleep Table")
          .doc()
          .set({
        "time": dateTime,
        "displayTime": displayTime,
        "displayTimeWithYear": dateTime.toString().substring(0, 16)
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> displayTable(String activity, DateTime dateTime) async {
    try {
      await firebaseFireStore
          .collection("Display Table")
          .doc(firebaseAuth.currentUser.uid)
          .collection("Display")
          .doc()
          .set({
        "displayTable":
            "$activity  at: ${dateTime.toString().substring(10, 16)}",
        "time": dateTime,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
