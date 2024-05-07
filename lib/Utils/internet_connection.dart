import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

InternetConnection internetConnectionChecker = InternetConnection();

enum ConnectionStatus {
  online,
  offline,
}

class InternetConnection {
  InternetConnection() {
    _checkInternetConnection();
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectionStatus> _controller = StreamController<ConnectionStatus>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _connectionSubscription;
  ConnectionStatus _currentStatus = ConnectionStatus.online;

  bool get hasInternet => _currentStatus == ConnectionStatus.online;
  bool get hasNoInternet => !hasInternet;

  Stream<ConnectionStatus> internetStatus() {
    _connectionSubscription ??= _connectivity.onConnectivityChanged.listen((_) => _checkInternetConnection());

    return _controller.stream;
  }

  Future<void> _checkInternetConnection() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final ConnectionStatus status = await checkInternet();

    _updateStatus(status);
  }

  Future<ConnectionStatus> checkInternet() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty ? ConnectionStatus.online : ConnectionStatus.offline;
    } on SocketException catch (_) {
      return ConnectionStatus.offline;
    }
  }

  void _updateStatus(ConnectionStatus status) {
    _currentStatus = status;
    _controller.add(status);
  }

  Future<void> close() async {
    await _connectionSubscription?.cancel();
    await _controller.close();
  }
}
