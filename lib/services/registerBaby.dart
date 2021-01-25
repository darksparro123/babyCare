import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterBabies {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  //registed Baby
  Future<bool> registerBaby(String babysName, String babysAge) async {
    try {
      await firebaseFireStore
          .collection("Baby's Details")
          .doc(firebaseAuth.currentUser.uid)
          .collection(babysName)
          .doc()
          .set({
        "babysName": babysName,
        "babysAge": babysAge,
      });
      return true;
    } catch (e) {
      print(e.toString());
    }
  }
}
