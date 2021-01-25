import 'package:babycare/screens/authentication/authenticationStyle.dart';
import 'package:babycare/screens/authentication/signIn.dart';
import 'package:babycare/screens/babyRegister/babyRegister.dart';
import 'package:babycare/services/auth.dart';
import 'package:babycare/widgets/mainWidgets.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  AuthenticationStyles authenticationStyles = AuthenticationStyles();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  MainWidgets mainWidgets = MainWidgets();
  final _formKey = GlobalKey<FormState>();
  AuthMethods authMethods = AuthMethods();
  String motionController = "idle";
  String failedText = "";
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
                                  await authMethods.registerUser(
                                _emailController.text,
                                _passwordController.text,
                              );
                              if (shouldNavigate) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BabyRegister(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  failedText =
                                      "Signup failed,incorrect email password or poor connection ";
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
                                "Sign Up",
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
                                "Already have an account?",
                                style: mainWidgets.textSTyle(
                                  Colors.blue[600],
                                  MediaQuery.of(context).size.width / 25.0,
                                  FontWeight.w600,
                                  TextDecoration.none,
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  "Sign In Now",
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
                                        return SigninPage();
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
