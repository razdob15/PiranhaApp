import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:piranhaapp/main.dart';
import 'package:piranhaapp/screens/chatsPage.dart';
import 'package:piranhaapp/utils/location_util.dart';
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
  final String HARDCODED_USERNAME = "123456789";

  final String HARDCODED_PASSWORD = "1234";

  late IO.Socket socket;

  String username = "";

  String password = "";

  final HashMap<String, List<Message>> messages = HashMap();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.jpeg'),
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
                      Button(() async {
                        if (await manageLogin(username == HARDCODED_USERNAME &&
                            password == HARDCODED_PASSWORD)) {
                          isLoading = true;
                        }
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
              )
            : const CircularProgressIndicator(
                semanticsLabel: 'Loading',
              ),
      )),
    );
  }

  Future<bool> manageLogin(bool isUserExists) async {
    if (isUserExists) {
      changeUserID(username);
      initSocket();
      // fetchLocation();
      return true;
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Oops.. username or password are incorrect!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
      return false;
    }
  }

  void initSocket() {
    final SocketService socketService = injector.get<SocketService>();

    socketService.createSocketConnection((data, messages) {
      print('object');
      var json = data;
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
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatPage(chatUsers: messages)));
    }, messages);
  }

  void addMessageWhenSender(currMessage, messages) {
    List<Message> messagesList =
        messages[currMessage['recievedUserID'].toString()];
    messagesList.add(Message(
      receiverId: currMessage['recievedUserID'].toString(),
      senderId: currMessage['sentUserID'].toString(),
      text: currMessage['content'],
      time: DateTime.parse(currMessage['timestamp']),
      currentUser: username,
    ));
    messages[currMessage['recievedUserID'].toString()] = messagesList;
  }

  void addMessageWhenReciever(currMessage, messages) {
    List<Message> messagesList = messages[currMessage['sentUserID'].toString()];
    messagesList.add(Message(
      receiverId: currMessage['recievedUserID'].toString(),
      senderId: currMessage['sentUserID'].toString(),
      text: currMessage['content'],
      time: DateTime.parse(currMessage['timestamp']),
      currentUser: username,
    ));
    messages[currMessage['sentUserID'].toString()] = messagesList;
  }

  void initRecievedMessageList(currMessage, messages) {
    messages[currMessage['sentUserID'].toString()] = <Message>[
      Message(
        receiverId: currMessage['recievedUserID'].toString(),
        senderId: currMessage['sentUserID'].toString(),
        text: currMessage['content'],
        time: DateTime.parse(currMessage['timestamp']),
        currentUser: username,
      )
    ];
  }

  void initSentMessageList(currMessage, messages) {
    messages[currMessage['recievedUserID'].toString()] = <Message>[
      Message(
        receiverId: currMessage['sentUserID'].toString(),
        senderId: currMessage['sentUserID'].toString(),
        text: currMessage['content'],
        time: DateTime.parse(currMessage['timestamp']),
        currentUser: username,
      )
    ];
  }
}
