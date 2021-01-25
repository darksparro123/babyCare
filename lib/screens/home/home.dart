import 'package:babycare/screens/home/homeWidgets.dart';
import 'package:babycare/services/information.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeWidgets homeWidgets = HomeWidgets();
  Information infromation = Information();
  String babysName;
  getBabysName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        babysName = prefs.getString("babysName");
        print(babysName);
      },
    );
  }

  @override
  void initState() {
    getBabysName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //height: double.maxFinite,
          child: ListView(
            //scrollDirection: Axis.vertical,
            children: [
              homeWidgets.homeAppBar(context),
              homeWidgets.buttonRow(context, babysName),
              homeWidgets.homePageStream(context),
              /* homeWidgets.streamPannel(
                  "Feed Table", babysName, "Feed at", context),
              homeWidgets.streamPannel(
                  "Peed Table", babysName, "Peed at", context),
              homeWidgets.streamPannel(
                  "Pood Table", babysName, "Poop at", context),
              homeWidgets.streamPannel(
                  "Sleep Table", babysName, "Sleep at", context),*/
              //homeWidgets.showButtonRow(context),
            ],
          ),
        ),
      ),
    );
  }
}
