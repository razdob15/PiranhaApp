import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:piranhaapp/utils/user_util.dart';
import 'package:piranhaapp/widgets/message.dart';
import 'chatState.dart';
import 'package:piranhaapp/widgets/message.dart';

class Listtt extends StatefulWidget {
  final Map<String, List<Message>> chatUsers;

  const Listtt({Key? key, required this.chatUsers}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return InputState(currUserId: getUserID());
  }
}

class InputState extends State<Listtt> {
  int currUserId;

  InputState({Key? key, required this.currUserId});

  // final Map<int, List<Message>> chatUsers = {
  //   111111111: [
  //     Message(
  //         text: "Hello Will",
  //         time: DateTime.parse('1969-07-21 06:11:04Z'),
  //         currUserId: "Will",
  //         senderId: "Tom"),
  //     Message(
  //         text: "hi Tom",
  //         time: DateTime.parse('1969-07-23 06:18:04Z'),
  //         currUserId: "Will",
  //         senderId: "Will")
  //   ],
  //   2222222222: [
  //     Message(
  //         text: "Hi Will",
  //         time: DateTime.parse('2020-07-20 06:18:04Z'),
  //         currUserId: "Will",
  //         senderId: "Maya"),
  //     Message(
  //         text: "hi Maya",
  //         time: DateTime.parse('2020-07-20 06:23:04Z'),
  //         currUserId: "Will",
  //         senderId: "Will"),
  //     Message(
  //         text: "By",
  //         time: DateTime.parse('2020-07-20 06:23:04Z'),
  //         currUserId: "Will",
  //         senderId: "Maya")
  //   ]
  // };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.chatUsers.length,
      shrinkWrap: true,
    
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) {
        return ConversationList(
          sentFrom: widget.chatUsers.keys.elementAt(index).toString(),
          messageText: widget.chatUsers.values
              .elementAt(index)[widget.chatUsers.values.elementAt(index).length - 1]
              .text
              .toString(),
          time: widget.chatUsers.values
              .elementAt(index)[widget.chatUsers.values.elementAt(index).length - 1]
              .time,
          messages: widget.chatUsers.values.elementAt(index),
        );
      },
    );
  }
}
