import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: LottieBuilder.asset(
            "assets/night.json",
            // reverse: true,
            // options: LottieOptions(enableApplyingOpacityToLayers: true),
            fit: BoxFit.fill,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  // height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Refresh Slave Screen'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Reset Slave Screen'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Clear Ballons'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Relaunch'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Reboot'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Power OFF'),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// refresh slave
// reset slave
// clear ballons
// re launch 
// reboot 
// power Off