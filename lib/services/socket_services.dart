import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  connecting,
  online,
  offline,
}

class SocketService with ChangeNotifier {
  late ServerStatus _serverStatus = ServerStatus.connecting;
  late Socket _socket;

  SocketService() {
    _initConfig();
  }

  Function get emit => _socket.emit;
  ServerStatus get serverStatus => _serverStatus;
  Socket get socket => _socket;

  void _initConfig() {
    // Dart client
    _socket = io(
        'https://server-pesas-production.up.railway.app/',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    _socket.on('mensaje', (payload) {
      //print('${payload['peso']}');
    });
  }
}
