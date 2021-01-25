import 'package:babycare/screens/home/home.dart';
import 'package:babycare/screens/summery/summery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<NavBar> {
  List<Widget> screens = [Home(), Summery()];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Record"),
            icon: Icon(
              Icons.pending,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Summary"),
            icon: Icon(
              Icons.grid_off,
            ),
          ),
        ],
      ),
    );
  }
}
