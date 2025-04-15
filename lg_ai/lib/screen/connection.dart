import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '/service/lg_connection.dart';
import '/service/shared_pref.dart';
import '/service/ssh_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  bool isConnected = false;

  LGConnection _lg = LGConnection();
  SSHService ssh = SSHService();

  TextEditingController _user = TextEditingController(text: 'lg');
  TextEditingController _pass = TextEditingController(text: 'lg');
  TextEditingController _ip = TextEditingController();
  TextEditingController _rigs = TextEditingController();
  TextEditingController _port = TextEditingController(text: '22');

  Future<List<String?>> _getPersistence() async {
    SharedPreferencesWithCache prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        // allowList: <String>{'repeat', 'action'},
      ),
    );

    final p_Ip = prefs.getString('master_ip');
    final p_pass = prefs.getString('master_password');
    final p_port = prefs.getString('master_portNumber');
    final p_user = prefs.getString('master_username');

    _user.text = p_user!;
    _pass.text = p_pass!;
    _ip.text = p_Ip!;
    _port.text = p_port!;
    return [p_Ip, p_pass, p_port, p_user];
  }

  onSubmit(
    String user,
    String pass,
    String ip,
    String port,
    String rigs,
  ) async {
    // Navigator.pop(context);
    await SharedPref.setData(user, pass, ip, port, rigs, true);
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context).pop();
        });
        return SizedBox(
          width: 100,
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
    await _lg.connect();

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _getPersistence();
  }

  @override
  void dispose() {
    super.dispose();
    _ip.dispose();
    _pass.dispose();
    _port.dispose();
    _user.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: LottieBuilder.asset('assets/night.json', fit: BoxFit.fill),
        ),
        Center(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Form(
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Connect with LG',
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    // SizedBox(width: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.person_2_outlined),
                        border: OutlineInputBorder(),

                        label: Text('Username'),
                      ),
                      controller: _user,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        label: Text('Password'),
                        // prefixIcon: Icon(Icons.key_outlined),
                      ),
                      controller: _pass,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        label: Text('IP Address'),
                        // prefixIcon: Icon(Icons.router_outlined),
                      ),
                      controller: _ip,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        label: Text('Port'),
                        // prefixIcon: Icon(Icons.computer_outlined),
                      ),
                      controller: _port,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        label: Text('Number of rigs'),
                        // prefixIcon: Icon(Icons.computer_outlined),
                      ),
                      controller: _rigs,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          onSubmit(
                            _user.text,
                            _pass.text,
                            _ip.text,
                            _port.text,
                            _rigs.text,
                          );
                          setState(() {
                            isConnected = !isConnected;
                          });
                        },
                        child: Text('Connect'),
                      ),
                    ),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
