import 'package:babycare/loading.dart';
import 'package:babycare/screens/navBar/navBar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/authentication/signIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String babyName;
+-
  SharedPreferences prefs = await SharedPreferences.getInstance();
  babyName = prefs.getString("babysName");

  print(babyName);
  runApp(
    MaterialApp(
      home: (babyName == null) ? SigninPage() : NavBar(),
    ),
  );
}
