import 'package:flutter/material.dart';
import 'package:piranhaapp/screens/singlePageChat.dart';

class ConversationList extends StatefulWidget{
  String sentFrom;
  String me;
  String messageText;
  String imageUrl;
  DateTime time;
  ConversationList({Key? key, required this.sentFrom, required this.me,required this.messageText,required this.imageUrl,required this.time}) : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SinglePageChat(sentFrom: widget.sentFrom, me: widget.sentFrom)),
            );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
          decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(width: 1.0, color: Colors.white),
          ),
          color: Colors.green[50],
        ),
  
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                radius: 40.0,
                backgroundImage:
                    NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                backgroundColor: Colors.transparent,
  
              ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.sentFrom, style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('${widget.time.hour}:${widget.time.minute}',style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}