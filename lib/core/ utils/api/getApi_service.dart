import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/features/signOut/provider/authProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
////flutter build appbundle --release

final dioProvider = Provider<Dio>((ref) {
  return Dio()
    ..options = BaseOptions(
      extra: {'requiresAuth': true},
      baseUrl: "https://api.curnectgate.com/api/v1/",
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {}
          return handler.next(error);
        },
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            final prefs = SharedPrefsService();
            log("Session expired (401 detected)");
            final token = await prefs.getAuthData();

            if (token != null) {
              ref.read(sessionExpiredProvider.notifier).expire();
              log(
                "HERE WE CAN CHECK THE STATUS>" +
                    ref.read(sessionExpiredProvider).toString(),
              );
            } else {
              log(
                "AUTH WAS NOT AVAILABLE " +
                    ref.read(sessionExpiredProvider).toString(),
              );
            }
          }
          return handler.next(error);
        },
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = SharedPrefsService();

          final cookie = await prefs.getSessionCookie();
          final token = await prefs.getUserToken();
          if (options.extra['requiresAuth'] == true) {
            options.headers['Authorization'] = 'Bearer $token';
            if (cookie != null) {
              options.headers['Cookie'] = cookie;
            }
          }

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          final rawCookies = response.headers['set-cookie'];
          if (rawCookies != null && rawCookies.isNotEmpty) {
            await SharedPrefsService().saveSessionCookie(
              rawCookies.first.split(';').first,
            );
          }
          return handler.next(response);
        },
      ),
    )
    ..interceptors.add(LogInterceptor(error: true));
});
