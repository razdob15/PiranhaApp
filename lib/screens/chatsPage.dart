import 'package:flutter/material.dart';
import 'package:piranhaapp/widgets/message.dart';
import '../widgets/chatsList.dart';
import '../widgets/searchBar.dart';

class ChatPage extends StatefulWidget {
final Map<String, List<Message>> chatUsers;

  const ChatPage({Key? key, required this.chatUsers}) : super(key: key);

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
        SearchBar(),
        Flexible(child: Listtt()),
      ]
    );
  }
}