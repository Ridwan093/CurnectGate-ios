import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MessagesHelpers {
  Future<bool> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<String> cacheFile(String url) async {
    if (url.startsWith('/')) return url; // Already local
    final file = await DefaultCacheManager().getSingleFile(url);
    return file.path;
  }
}
