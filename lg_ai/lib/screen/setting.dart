import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 10,

          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text('Refresh Slave Screen'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Reset Slave Screen')),
            OutlinedButton(onPressed: () {}, child: Text('Clear Ballons')),
            OutlinedButton(onPressed: () {}, child: Text('Relaunch')),
            OutlinedButton(onPressed: () {}, child: Text('Reboot')),
            OutlinedButton(onPressed: () {}, child: Text('Power OFF')),
          ],
        ),
      ),
    );
  }
}
// refresh slave
// reset slave
// clear ballons
// re launch 
// reboot 
// power Off