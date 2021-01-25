import 'package:babycare/screens/babyRegister/babyRegisterStyles.dart';
import 'package:babycare/services/registerBaby.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../loading.dart';

class BabyRegister extends StatefulWidget {
  @override
  _BabyRegisterState createState() {
    return _BabyRegisterState();
  }
}

class _BabyRegisterState extends State<BabyRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController babysName = TextEditingController();
  String babysAge;
  BabyRegisteStyles babyRegisterStyle = BabyRegisteStyles();
  String year = "Years", month = "Months", age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: babysName,
                  style: babyRegisterStyle.formFieldTextStyle(),
                  decoration: babyRegisterStyle.inputFieldDecoration(
                      "Mehtu", "Baby's Name"),
                ),
                Text(
                  "Baby's Age",
                  style: babyRegisterStyle.formFieldTextStyle(),
                ),
                SizedBox(height: 15.0),
                DropdownButtonFormField(
                  decoration:
                      babyRegisterStyle.inputFieldDecoration("Years", "Years"),
                  items: [
                    DropdownMenuItem(
                      value: "01 Years",
                      child: Text(
                        "01 Years",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "02 Years",
                      child: Text(
                        "02 Years",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "03 Years",
                      child: Text(
                        "03 Years",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      year = val;
                      print(year);
                    });
                  },
                ),
                SizedBox(height: 15.0),
                DropdownButtonFormField(
                  decoration:
                      babyRegisterStyle.inputFieldDecoration("Years", "Months"),
                  items: [
                    DropdownMenuItem(
                      value: "01 Months",
                      child: Text(
                        "01 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "02 Months",
                      child: Text(
                        "02 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "03 Months",
                      child: Text(
                        "03 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "04 Months",
                      child: Text(
                        "04 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "05 Months",
                      child: Text(
                        "05 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "06 Months",
                      child: Text(
                        "06 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "07 Months",
                      child: Text(
                        "07 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "08 Months",
                      child: Text(
                        "08 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "09 Months",
                      child: Text(
                        "09 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "10 Months",
                      child: Text(
                        "10 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "11 Months",
                      child: Text(
                        "11 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "12 Months",
                      child: Text(
                        "12 Months",
                        style: babyRegisterStyle.formFieldTextStyle(),
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      month = val;
                      babysAge = "${year} $month";
                      print(babysAge);
                    });
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                InkWell(
                  onTap: () async {
                    bool shouldNavigate = await RegisterBabies()
                        .registerBaby(babysName.text, babysAge);
                    print(babysName.text);
                    if (shouldNavigate) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("babysName", babysName.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loading()));
                      print("sucuss");
                    }
                  },
                  child: Container(
                      width: 150,
                      height: 50.0,
                      decoration: babyRegisterStyle.submitButton(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: babyRegisterStyle.buttonText(),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
