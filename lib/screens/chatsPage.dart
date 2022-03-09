import 'package:flutter/material.dart';
import 'package:piranhaapp/utils/user_util.dart';
import 'package:piranhaapp/widgets/chatState.dart';
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
    print(widget.chatUsers['2']![0].currUserId + ' ' + widget.chatUsers['2']![0].currUserId);
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'logoChatPage.jpeg',
          width: 1000,
          height: 230,
          fit: BoxFit.fill,
        ),
        SearchBar(),
        Listtt(chatUsers: widget.chatUsers),
      ]),
    );
  }
}
