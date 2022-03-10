import 'dart:collection';

import 'package:socket_io_client/socket_io_client.dart' as IO;

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
}
