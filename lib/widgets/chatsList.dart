import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:piranhaapp/widgets/message.dart';
import 'chatState.dart';
import 'chatObject.dart';

class Listtt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<Listtt> {
  
  final Map<int, List<ChatUsers>> chatUsers = {111111111: [ChatUsers(sentFrom: 111111111, messageText: "What's upp?", time: DateTime.parse('1969-07-20 20:18:04Z')), ChatUsers(sentFrom: 3333333333, messageText: "hello", time: DateTime.parse('1969-07-20 20:20:04Z'))]
                                            , 222222222: [ChatUsers(sentFrom: 111111111, messageText: "hiiiiii", time: DateTime.parse('1969-07-20 06:18:04Z'))]
                                            , 333333333: [ChatUsers(sentFrom: 111111111, messageText: "Idannnnnnnn", time: DateTime.parse('1969-07-20 06:18:04Z')), ChatUsers(sentFrom: 111111111, messageText: "Roniiiiii", time: DateTime.parse('1969-07-20 06:18:04Z')) ]};
  
  // List<ChatUsers> chatUsers = [
  //   ChatUsers(sentFrom: 111111111, messageText: "Awesome Setup", time: DateTime.parse('1969-07-20 20:18:04Z')),
  //   ChatUsers(sentFrom: 222222222, messageText: "That's Great", time: DateTime.parse('1969-07-20 16:31Z')),
  //   ChatUsers(sentFrom: 333333333, messageText: "Hey where are you?", time: DateTime.parse('1969-07-20 10:18:04Z')),
  //   ChatUsers(sentFrom: 444444444, messageText: "Busy! Call me in 20 mins", time: DateTime.parse('1969-07-20 06:20:04Z'))
  // ];
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  itemCount: chatUsers.length,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 16),
  itemBuilder: (context, index){
    return ConversationList(
      sentFrom: chatUsers.keys.elementAt(index).toString(),
      messageText: chatUsers.values.elementAt(index)[0].messageText.toString(),
      time: chatUsers.values.elementAt(index)[0].time,
    );
  },
);
  }
}