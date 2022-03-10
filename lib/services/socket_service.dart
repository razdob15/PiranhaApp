import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../widgets/message.dart';

class SocketService {
  late IO.Socket socket;

  createSocketConnection(Function onConnected, HashMap messages) {
      socket = IO.io('http://10.10.244.47:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.emit('getInfo');
    socket.on("userMessages", (data) => onConnected(data, messages));
  }
  
  sendMessage(messageToSend) {
    this.socket.emit('sendMessage', jsonEncode(messageToSend));
  }
}
