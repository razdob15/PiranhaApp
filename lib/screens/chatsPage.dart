import 'package:flutter/material.dart';
import '../widgets/chatsList.dart';
import '../widgets/searchBar.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(children: [
        Image.asset
    ('logoChatPage.jpeg',
    width: 1000,
    height: 200,
    fit: BoxFit.fill,
 ),
        SearchBar(),
        Flexible(child: Listtt()),
      ]),
    );
  }
}
