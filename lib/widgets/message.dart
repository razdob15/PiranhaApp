import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';

class Message extends StatelessWidget {
  String text;
  DateTime time;
  bool isCurrUser;

  Message({Key? key, required this.text, required this.time, required this.isCurrUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(left: 14, right: 14, top: 2, bottom: 2),
        child: Bubble(
          margin: const BubbleEdges.only(top: 2),
          alignment: isCurrUser ? Alignment.topRight : Alignment.topLeft,
          nipWidth: 30,
          nipHeight: 10,
          nip: isCurrUser ? BubbleNip.rightBottom : BubbleNip.leftBottom,
          color: isCurrUser ? Theme.of(context).primaryColorLight : Colors.white,
          child: Column(mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isCurrUser ? CrossAxisAlignment.start : CrossAxisAlignment.end, 
          children: [
            Text(text),
            Text(
              DateFormat.Hm().format(time),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}