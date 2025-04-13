import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lg_ai/screen/navigation.dart';
import '/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env"); // you can ommit filename argument
  //IF 1. you have define .env in root dir
  //2. assets in pubspec.yml is only .env
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeChanger())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeprovider.themeMode,
      darkTheme: ThemeData.dark(),

      // theme: themeprovider.check(),
      theme: allThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text('KISS App'),
          elevation: 4,
          // backgroundColor: Colors.white12, // This will override the theme
          // foregroundColor: Colors.white12,
        ),
        body: Navigation(),
      ),
    );
  }
}
