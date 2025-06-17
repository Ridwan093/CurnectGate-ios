import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { isConnected, isDisconnected }


final connectivityStatusProvider = StreamProvider<ConnectivityStatus>((ref) {
  return Connectivity().onConnectivityChanged.map((result) {
    // ignore: unrelated_type_equality_checks
    return result != ConnectivityResult.none 
        ? ConnectivityStatus.isConnected 
        : ConnectivityStatus.isDisconnected;
  });
});