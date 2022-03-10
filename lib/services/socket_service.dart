import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  createSocketConnection(Function onConnected) {
    try {
      socket = IO.io('http://20.93.144.32:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      socket.on("connect", (_) {
        print('connect');
        socket.emit('getInfo', 1);
        socket.on("userMessages", (data) => onConnected(data));
      });
      this.socket.on("reconnect", (_) => print("Reconnected"));
    } catch (e) {
      print(e.toString());
    }
  }
}
