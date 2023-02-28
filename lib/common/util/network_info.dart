import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart' show PublishSubject;

abstract class NetworkInfo {
  Stream<ConnectivityResult> get resultStream;

  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectivity) {
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _resultSubject.sink.add(result);
      print('CONNECTIVITY RESULT $result');
    });
  }

  final Connectivity connectivity;
  final PublishSubject<ConnectivityResult> _resultSubject = PublishSubject<ConnectivityResult>();

  Stream<ConnectivityResult> get resultStream => _resultSubject.stream;

  Future<bool> get isConnected async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future<bool>.value(true);
      } else {
        return Future<bool>.value(false);
      }
    } on SocketException catch (_) {
      return Future<bool>.value(false);
    }
  }
}
