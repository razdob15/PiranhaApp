import 'package:flutter/material.dart';
import 'package:piranhaapp/screens/singlePageChat.dart';
import 'package:piranhaapp/widgets/message.dart';
import 'package:intl/intl.dart';

class ConversationList extends StatefulWidget {
  String sentFrom;
  String messageText;
  DateTime time;
  List<Message> messages;

  ConversationList(
      {Key? key,
      required this.sentFrom,
      required this.messageText,
      required this.time,
      required this.messages})
      : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
              builder: (context) => SinglePageChat(
                  sentFrom: widget.sentFrom, messages: widget.messages)),
        )
            .then((value) {
          this.widget.messageText = value.text;
          this.widget.time = value.time;
          setState(() {
          });
        });
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(width: 1.0, color: Colors.white),
            top: BorderSide(width: 1.0, color: Colors.white)
          ),
          color: Theme.of(context).primaryColorDark,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.sentFrom,
                            style: const TextStyle(fontSize: 25, color: Color.fromARGB(255, 219, 218, 218), fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(widget.messageText,
                              style: const TextStyle(
                                  fontSize: 16, color: Color.fromARGB(255, 219, 218, 218)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(DateFormat.Hm().format(widget.time),
                style: const TextStyle(fontSize: 12, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
