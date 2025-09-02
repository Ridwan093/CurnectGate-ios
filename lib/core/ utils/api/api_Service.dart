import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
  (ref) =>
      Dio()
        ..options = BaseOptions(
          baseUrl: "https://staging.curnectgate.com",
          headers: {'Content-Type': 'application/json'},
        )
        // ..interceptors.add(LogInterceptor(responseBody: true)),
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              // Only proceed with token if this request requires auth
              if (options.extra['requiresAuth'] == true) {}
              return handler.next(options);
            },
          ),
        )
        ..interceptors.add(
          LogInterceptor(
            request: true,
            responseBody: true,
            requestBody: true,
            error: true,
          ),
        ),
);
/// 6uvqvHT4 => ridwan3310@gmail.com
/// XN7AqwA8 => ridwanjimoh378@gmail.com
/// XN7AqwA8