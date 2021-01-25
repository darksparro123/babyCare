import 'package:babycare/screens/authentication/authenticationStyle.dart';
import 'package:babycare/screens/authentication/signUp.dart';
import 'package:babycare/services/auth.dart';
import 'package:babycare/widgets/mainWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter/material.dart';

import '../../loading.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() {
    return _SigninPageState();
  }
}

class _SigninPageState extends State<SigninPage> {
  AuthenticationStyles authenticationStyles = AuthenticationStyles();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  MainWidgets mainWidgets = MainWidgets();
  final _formKey = GlobalKey<FormState>();
  AuthMethods authMethods = AuthMethods();
  String motionController = "idle";
  String failedText = "";

  Future<bool> getBabysName() async {
    try {
      Stream<DocumentSnapshot> a = FirebaseFirestore.instance
          .collection("Baby's Details")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .snapshots();
      a.map((event) => print("babys name is ${event.id}"));
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  void initState() {
    getBabysName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: authenticationStyles.mainContainerDecoration(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.width / 0.7,
                  decoration: authenticationStyles.centerContainerDecoration(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: MediaQuery.of(context).size.width / 2.4,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber[600],
                            child: ClipOval(
                              child: FlareActor(
                                "assets/teddy_test.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: motionController,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            controller: _emailController,
                            onChanged: (val) {},
                            validator: (val) {
                              return RegExp('^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))')
                                          .hasMatch(val) |
                                      val.isEmpty
                                  ? "Please enter valid email"
                                  : null;
                            },
                            style: authenticationStyles.formFieldTextStyle(),
                            decoration:
                                authenticationStyles.inputFieldDecoration(
                              "user@gmail.com",
                              "Email",
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            validator: (val) => val.length < 7
                                ? "please enter strong password"
                                : null,
                            onChanged: (val) {
                              if (val.length < 7) {
                                setState(() {
                                  motionController = "fail";
                                });
                              } else {
                                setState(() {
                                  motionController = "success";
                                });
                              }
                            },
                            style: authenticationStyles.formFieldTextStyle(),
                            decoration:
                                authenticationStyles.inputFieldDecoration(
                              "071656Ad",
                              "Password",
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          failedText,
                          textAlign: TextAlign.center,
                          style: mainWidgets.textSTyle(
                            Colors.red,
                            MediaQuery.of(context).size.width / 25.0,
                            FontWeight.bold,
                            TextDecoration.none,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              bool shouldNavigate =
                                  await authMethods.signInUser(
                                      _emailController.text,
                                      _passwordController.text);
                              if (shouldNavigate) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loading(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  failedText =
                                      "Signin failed,incorrect email password or poor connection ";
                                  motionController = "fail";
                                });
                              }
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 45.0,
                            decoration: authenticationStyles.signButton(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                                style: authenticationStyles.buttonText(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: mainWidgets.textSTyle(
                                  Colors.blue[600],
                                  MediaQuery.of(context).size.width / 25.0,
                                  FontWeight.w600,
                                  TextDecoration.none,
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  "Sign Up Now",
                                  style: mainWidgets.textSTyle(
                                    Colors.red[600],
                                    MediaQuery.of(context).size.width / 25.0,
                                    FontWeight.w900,
                                    TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SignupPage();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
