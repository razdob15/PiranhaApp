import 'package:flutter/material.dart';
import '../widgets/chatsList.dart';
import '../widgets/searchBar.dart';
class ChatPage extends StatefulWidget {
  // final Function(String) onChange;
  // cathPage({Key? key, required this.onChange}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<ChatPage> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(),
        Flexible(child: Listtt()),
      ]
    );
  }
}