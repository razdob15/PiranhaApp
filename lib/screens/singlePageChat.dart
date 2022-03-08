import 'package:flutter/material.dart';
import 'package:piranhaapp/widgets/message.dart';

class SinglePageChat extends StatefulWidget {
  final String sentFrom;
  final String me;
  const SinglePageChat({Key? key,required this.sentFrom, required this.me}) : super(key: key);
  @override
  _SinglePageChatState createState() => _SinglePageChatState();
}

class _SinglePageChatState extends State<SinglePageChat> {

  List<Message> messages = [
    Message(
        text: "Hello, Will",
        time: DateTime.now(),
        currUserId: "Kriss",
        senderId: "Kriss"),
    Message(
        text: "How have you been?",
        time: DateTime.now(),
        currUserId: "Kriss",
        senderId: "Kriss"),
    Message(
        text: "Hey Kriss, I am doing fine dude. wbu?",
        time: DateTime.now(),
        currUserId: "Kriss",
        senderId: "Will"),
    Message(
        text: "ehhhh, doing OK.",
        time: DateTime.now(),
        currUserId: "Kriss",
        senderId: "Kriss"),
    Message(
        text: "Is there any thing wrong?",
        time: DateTime.now(),
        currUserId: "Kriss",
        senderId: "Will"),
  ];

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Kriss Benwat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 50,
                    child: messages[index],
                  ))
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                      controller: myController,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      print(myController.text);
                      myController.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
