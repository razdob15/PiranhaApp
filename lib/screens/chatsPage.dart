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
      color: Theme.of(context).primaryColorDark ,
      child: Column(
        children: [
          SearchBar(),
          Flexible(child: Listtt()),
        ]
      ),
    );
  }
}