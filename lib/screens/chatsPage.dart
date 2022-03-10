import 'package:flutter/material.dart';
import 'package:piranhaapp/utils/user_util.dart';
import 'package:piranhaapp/widgets/chatState.dart';
import 'package:piranhaapp/widgets/message.dart';
import '../widgets/chatsList.dart';
import '../widgets/searchBar.dart';

class ChatPage extends StatefulWidget {
  final Map<String, List<Message>> chatUsers;

  ChatPage({Key? key, required this.chatUsers}) : super(key: key);

  String searchInput = '';

  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'assets/logoChatPage.jpeg',
          width: 1000,
          height: 230,
          fit: BoxFit.fill,
        ),
        SearchBar(onChange: (value) {
          setState(() {
            widget.searchInput = value.toLowerCase();
          });
        }),
        Listtt(chatUsers: widget.chatUsers, searchInput: widget.searchInput),
      ]),
    );
  }
}
