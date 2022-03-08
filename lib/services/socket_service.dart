import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  createSocketConnection() {
    try {
      socket = IO.io('http://10.10.244.50:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      this.socket.on("connect", (_) => print("Connected"));
      this.socket.on("reconnect", (_) => print("Reconnected"));
    } catch (e) {
      print(e.toString());
    }
  }
}
