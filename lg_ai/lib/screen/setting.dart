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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              // height: 40,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Refresh Slave Screen'),
              ),
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Reset Slave Screen'),
              ),
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Clear Ballons'),
              ),
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(onPressed: () {}, child: Text('Relaunch')),
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(onPressed: () {}, child: Text('Reboot')),
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(onPressed: () {}, child: Text('Power OFF')),
            ),
            SizedBox(height: 80),
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