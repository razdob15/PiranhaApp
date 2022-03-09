import 'dart:collection';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  createSocketConnection(Function onConnected, HashMap messages) {
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on("connect", (_) {
      socket.emit('getInfo');
      print("cool");
      socket.on("connected", (data) => onConnected(data, messages));
    });
    socket.on("reconnect", (_) => print("Reconnected"));
  }
}
