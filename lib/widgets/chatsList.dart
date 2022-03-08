import 'package:flutter/material.dart';
import 'chatState.dart';
import 'chatObject.dart';

class Listtt extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}


class InputState extends State<Listtt> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: './assets/profile.png', time: DateTime.parse('1969-07-20 20:18:04Z')),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "images/userImage2.jpeg", time: DateTime.parse('1969-07-20 16:31Z')),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "images/userImage3.jpeg", time: DateTime.parse('1969-07-20 10:18:04Z')),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "images/userImage4.jpeg", time: DateTime.parse('1969-07-20 06:20:04Z'))
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  itemCount: chatUsers.length,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 16),
  itemBuilder: (context, index){
    return ConversationList(
      name: chatUsers[index].name,
      messageText: chatUsers[index].messageText,
      imageUrl: chatUsers[index].imageURL,
      time: chatUsers[index].time,
    );
  },
);
  }
}