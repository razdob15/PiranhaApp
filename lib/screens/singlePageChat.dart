import 'package:flutter/material.dart';
import 'package:piranhaapp/main.dart';
import 'package:piranhaapp/services/socket_service.dart';
import 'package:piranhaapp/utils/user_util.dart';
import 'package:piranhaapp/widgets/message.dart';
import '../services/socket_service.dart';

class SinglePageChat extends StatefulWidget {
  final String sentFrom;
  final List<Message> messages;
  const SinglePageChat(
      {Key? key, required this.sentFrom, required this.messages})
      : super(key: key);
  @override
  _SinglePageChatState createState() => _SinglePageChatState();
}

class _SinglePageChatState extends State<SinglePageChat> {
  final myController = TextEditingController();
  final SocketService socketService =
                            injector.get<SocketService>();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
      socketService.socket.on('newMessage', (message) => 
        Row(
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 50,
                    child: message,
                  ))
                ],
              )
      );
    Scaffold sc = Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColorDark,
            
            flexibleSpace: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(widget.messages[widget.messages.length - 1]);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                
                    ),
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
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
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                                color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Stack(children: <Widget>[
              ListView.builder(
                controller: _scrollController,
                itemCount: widget.messages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Flexible(
                          child: SizedBox(
                        child: widget.messages[index],
                      ))
                    ],
                  );
                },
              )
            ])),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        controller: myController,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        String messageText = myController.text;
                        String currUserId = getUserID();
                            var messageToSend = Message(
                              text: messageText,
                              time: DateTime.now(),
                              currUserId: currUserId,
                              senderId: currUserId);
                            socketService.sendMessage(messageToSend);
                         setState(() {
                          widget.messages.add(Message(
                              text: messageText,
                              time: DateTime.now(),
                              currUserId: currUserId,
                              senderId: currUserId));
                        });

                        myController.clear();
                      },
                      child: const Icon(
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
        ));

    Future(() =>
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent));

    return sc;
  }
}
