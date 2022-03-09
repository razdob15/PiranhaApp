import 'package:flutter/material.dart';
import 'package:piranhaapp/widgets/message.dart';

class SinglePageChat extends StatefulWidget {
  final String sentFrom;
  const SinglePageChat({Key? key,required this.sentFrom}) : super(key: key);
  @override
  _SinglePageChatState createState() => _SinglePageChatState();
}

class _SinglePageChatState extends State<SinglePageChat> {

  final Map<int, List<Message>> chatUsers = {111111111: [ Message(text: "Hello Will",time: DateTime.parse('1969-07-21 06:11:04Z'), currUserId: "Will", senderId: "Tom"),Message(text: "hi Tom",time: DateTime.parse('1969-07-23 06:18:04Z'), currUserId: "Will", senderId: "Will")]
  , 2222222222: [ Message(text: "Hi Will",time: DateTime.parse('2020-07-20 06:18:04Z'), currUserId: "Will", senderId: "Maya"),Message(text: "hi Maya",time: DateTime.parse('2020-07-20 06:23:04Z'), currUserId: "Will", senderId: "Will"), Message(text: "By",time: DateTime.parse('2020-07-20 06:23:04Z'), currUserId: "Will", senderId: "Maya")]};
  
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
                      Text(
                        widget.sentFrom,
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
            itemCount: (chatUsers[int.parse(widget.sentFrom)])?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 50,
                    child: (chatUsers[int.parse(widget.sentFrom)])![index],
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
