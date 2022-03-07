import 'package:flutter/material.dart';

class PiranhaApp extends StatelessWidget {
  const PiranhaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff224FB4),
        primaryColorDark: const Color(0xff0A3B51),
        primaryColorLight: const Color(0xff849DA7),
        backgroundColor: const Color(0xffFDFFFC),
        primarySwatch: const MaterialColor(
          0xff224FB4,
          <int, Color>{
            50: Color(0xffFDFFFC),
            100: Color(0xffFDFFFC),
            200: Color(0xffFDFFFC),
            300: Color(0xffFDFFFC),
            400: Color(0xff849DA7),
            500: Color(0xff849DA7),
            600: Color(0xff849DA7),
            700: Color(0xff0A3B51),
            800: Color(0xff0A3B51),
            900: Color(0xff0A3B51),
          },
        ),
        textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, fontFamily: 'Hind'),
      titleSmall: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontFamily: 'Hind'),
      bodySmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
      ),
    );
  }
}