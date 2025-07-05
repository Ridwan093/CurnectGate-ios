import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
  (ref) =>
      Dio()
        ..options = BaseOptions(
          baseUrl: "https://staging.curnectgate.com",
          headers: {'Content-Type': 'application/json'},
        )
        ..interceptors.add(LogInterceptor(responseBody: true)),
);
