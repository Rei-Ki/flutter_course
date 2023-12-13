import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

main() {
  Map<String, dynamic> json = {
    "data": "Привет",
    "cmd": "echo",
  };

  WebSocketManager ws = WebSocketManager("ws://localhost:8765");
  ws.send(json);

  ws.stream.listen((message) {
    // channel.sink.close(status.goingAway);
    print("Recieved ${jsonDecode(message)}");
  });
}

class WebSocketManager {
  late WebSocketChannel channel;

  WebSocketManager(String url) {
    channel = WebSocketChannel.connect(
      Uri.parse(url),
    );
  }

  Stream<dynamic> get stream => channel.stream;

  void send(Map<String, dynamic> message) {
    channel.sink.add(jsonEncode(message));
  }

  void close() {
    channel.sink.close();
  }
}
