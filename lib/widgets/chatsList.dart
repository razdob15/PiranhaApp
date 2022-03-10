// import 'dart:collection';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:piranhaapp/utils/user_util.dart';
import 'package:piranhaapp/widgets/message.dart';
import 'chatState.dart';
// import 'package:piranhaapp/widgets/message.dart';

class Listtt extends StatefulWidget {
  final Map<String, List<Message>> chatUsers;
  final String searchInput;

  const Listtt({Key? key, required this.chatUsers, required this.searchInput})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<Listtt> {
  InputState({Key? key});



  @override
  Widget build(BuildContext context) {
    final List<String> chatUsersKeys = widget.chatUsers.keys
        .where((key) => key.toString().startsWith(this.widget.searchInput))
        .toList();
    print(this.widget.searchInput);
    return ListView.builder(
      itemCount: chatUsersKeys.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) {
        print(this.widget.searchInput);
        return ConversationList(
          sentFrom: chatUsersKeys[index].toString(),
          messageText: widget
              .chatUsers[chatUsersKeys[index]]![
                  widget.chatUsers[chatUsersKeys[index]]!.length - 1]
              .text,
          time: widget
              .chatUsers[chatUsersKeys[index]]![
                  widget.chatUsers[chatUsersKeys[index]]!.length - 1]
              .time,
          messages: widget.chatUsers[chatUsersKeys[index]] as List<Message>,
        );
      },
    );
  }
}
