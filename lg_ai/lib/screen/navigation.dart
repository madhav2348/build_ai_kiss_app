import 'package:flutter/material.dart';
import 'package:lg_ai/screen/connection.dart';
import 'package:lg_ai/screen/screen.dart';
import 'package:lg_ai/screen/setting.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Widget> item = [Screen(), ConnectionPage(), SettingScreen()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: item[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cable_outlined),
            label: 'Connect',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}
