import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';
import 'package:piranhaapp/utils/user_util.dart';

class Message extends StatelessWidget {
  String text;
  DateTime time;
  String senderId;
  String receiverId;
  String currentUser;


  Message(
      {Key? key,
      required this.text,
      required this.time,
      required this.receiverId,
      required this.senderId,
      required this.currentUser})
      : super(key: key);

  bool isCurrUser() {
    return senderId == currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 2, bottom: 2),
        child: Bubble(
          margin: const BubbleEdges.only(top: 10),
          alignment: isCurrUser() ? Alignment.topRight : Alignment.topLeft,
          nipWidth: 30,
          nipHeight: 15,
          nip: isCurrUser() ? BubbleNip.rightBottom : BubbleNip.leftBottom,
          color: isCurrUser()
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColorDark,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: isCurrUser()
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  maxLines: null,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    DateFormat.Hm().format(time),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'recievedUserID': receiverId,
        'sentUserID': senderId,
        'content': text,
        'timestamp': time.toLocal().toString(),
      };
}
