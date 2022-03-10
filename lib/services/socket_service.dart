import 'dart:collection';
import 'dart:convert';

import 'package:piranhaapp/utils/user_util.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../widgets/message.dart';

class SocketService {
  late IO.Socket socket;

  createSocketConnection(Function onConnected, HashMap messages) {
    socket = IO.io('http://10.10.244.48:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.emit('getInfo', getUserID());
    socket.on("userMessages", (data) => onConnected(data, messages));
  }

  sendMessage(messageToSend) {
    socket.emit('sendMessage', jsonEncode(messageToSend.toJson()));
  }
}
