import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../widgets/message.dart';

class SocketService {
  late IO.Socket socket;

  createSocketConnection(Function onConnected, HashMap messages) {
    try {
      socket = IO.io('http://localhost:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      this.socket.on("connect", (_) {
        this.socket.emit('getInfo');
        print("cool");
        this.socket.on("connected", (data) => onConnected(data, message));
        });
      this.socket.on("reconnect", (_) => print("Reconnected"));
    } catch (e) {
      print(e.toString());
    }
  }

  sendMessage(messageToSend) {
    this.socket.emit('sendMessage', jsonEncode(messageToSend));
  }
}
