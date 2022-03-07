import 'package:flutter/material.dart';

import 'widgets/message.dart';

void main() {
  runApp(PiranhaApp());
}

class PiranhaApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Message(text: "Hello this is5 a message! khdkljldl;d", time: DateTime.now(), isCurrUser: false,),
    );
  }
}