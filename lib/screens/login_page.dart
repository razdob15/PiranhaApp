import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piranhaapp/main.dart';
import 'package:piranhaapp/screens/chatsPage.dart';
import 'package:piranhaapp/utils/user_util.dart';
import 'package:piranhaapp/widgets/message.dart';
import '../../widgets/button.dart';
import '../services/socket_service.dart';
import '../widgets/input_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String HARDCODED_USERNAME = "1";

  final String HARDCODED_PASSWORD = "1234";

  late IO.Socket socket;

  String username = "";

  String password = "";

  final HashMap<String, List<Message>> messages = HashMap();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('logo.jpeg'),
            Column(
              children: [
                GeneralInput(
                  onChange: (input) {
                    username = input;
                  },
                  labelText: "Enter Username",
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                GeneralInput(
                  onChange: (input) {
                    password = input;
                  },
                  labelText: "Enter Password",
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                Button(() {
                  manageLogin(username == HARDCODED_USERNAME &&
                      password == HARDCODED_PASSWORD);
                }, "Log In"),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                const Text(
                  "Not yet Registered? Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                Button(() => {}, "Sign Up")
              ],
            )
          ],
        ),
      )),
    );
  }

  void manageLogin(bool isUserExists) {
    if (isUserExists) {
      changeUserID(username);
      // fetchLocation();
      initSocket();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatPage(chatUsers: messages)));
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Not Connected'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(
                'OK',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      );
    }
  }

  void initSocket() {
    final SocketService socketService = injector.get<SocketService>();

    socketService.createSocketConnection((data, messages) {
      var json = jsonDecode(data);
      for (var i = 0; i < json.length; i++) {
        if (json[i]['sentUserID'].toString() == username) {
          if (messages.containsKey(json[i]['recievedUserID'].toString())) {
            addMessageWhenSender(json[i], messages);
          } else {
            initSentMessageList(json[i], messages);
          }
        } else {
          if (messages.containsKey(json[i]['sentUserID'].toString())) {
            addMessageWhenReciever(json[i], messages);
          } else {
            initRecievedMessageList(json[i], messages);
          }
        }
      }
    }, messages);
  }

  void addMessageWhenSender(currMessage, messages) {
    List<Message> messagesList =
        messages[currMessage['recievedUserID'].toString()];
    messagesList.add(Message(
      currUserId: currMessage['sentUserID'].toString(),
      senderId: currMessage['recievedUserID'].toString(),
      text: currMessage['content'],
      time: DateTime.parse(currMessage['timestamp']),
    ));
    messages[currMessage['recievedUserID'].toString()] = messagesList;
  }

  void addMessageWhenReciever(currMessage, messages) {
    List<Message> messagesList = messages[currMessage['sentUserID'].toString()];
    messagesList.add(Message(
      currUserId: currMessage['recievedUserID'].toString(),
      senderId: currMessage['sentUserID'].toString(),
      text: currMessage['content'],
      time: DateTime.parse(currMessage['timestamp']),
    ));
    messages[currMessage['sentUserID'].toString()] = messagesList;
  }

  void initRecievedMessageList(currMessage, messages) {
    messages[currMessage['sentUserID'].toString()] = <Message>[
      Message(
        currUserId: currMessage['recievedUserID'].toString(),
        senderId: currMessage['sentUserID'].toString(),
        text: currMessage['content'],
        time: DateTime.parse(currMessage['timestamp']),
      )
    ];
  }

  void initSentMessageList(currMessage, messages) {
    messages[currMessage['recievedUserID'].toString()] = <Message>[
      Message(
        currUserId: currMessage['sentUserID'].toString(),
        senderId: currMessage['recievedUserID'].toString(),
        text: currMessage['content'],
        time: DateTime.parse(currMessage['timestamp']),
      )
    ];
  }
}
