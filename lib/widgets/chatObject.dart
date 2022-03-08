import 'package:flutter/cupertino.dart';

class ChatUsers{
  String sentFrom;
  String me;
  String messageText;
  String imageURL;
  DateTime time;
  ChatUsers({required this.sentFrom, required this.me, required this.messageText,required this.imageURL,required this.time});
}