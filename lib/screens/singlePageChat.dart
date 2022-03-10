import 'dart:async';

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
  final SocketService socketService = injector.get<SocketService>();

  Map<String, String> namesMap = {
    "123456789": "אלאדין",
    "987654321": "ג'יני",
    "111111111": "אבו",
  };

  Map<String, String> imagesMap = {
    "123456789":
        "https://upload.wikimedia.org/wikipedia/he/thumb/e/eb/Aladdin_Disney.jpg/250px-Aladdin_Disney.jpg",
    "987654321":
        "data:image/jpeg;base64,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",
    "111111111": "data:image/jpeg;base64,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",
  };

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    socketService.socket.on(
        'newMessage',
        (message) => Row(
              children: [
                Flexible(
                    child: SizedBox(
                  height: 50,
                  child: message,
                ))
              ],
            ));
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
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(imagesMap[widget.sentFrom].toString()),
                      maxRadius: 40,
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
                            namesMap[widget.sentFrom].toString(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            "Online",
                            style: TextStyle(color: Colors.white, fontSize: 13),
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
                        height: 70,
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
                        textInputAction: TextInputAction.go,
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
                      onPressed: () async {
                        String messageText = myController.text;
                        final SocketService socketService =
                            injector.get<SocketService>();
                        String userId = await getUserID();

                        var messageToSend = Message(
                          text: messageText,
                          time: DateTime.now(),
                          receiverId: widget.sentFrom,
                          senderId: userId,
                          currentUser: userId,
                        );

                        socketService.sendMessage(messageToSend);
                        setState(() {
                          widget.messages.add(messageToSend);
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
