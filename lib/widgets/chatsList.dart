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
    return InputState();
  }
}

class InputState extends State<Listtt> {

  InputState({Key? key});

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
