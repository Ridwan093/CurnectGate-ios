import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/signOut/provider/authProvider.dart';

final dioProvider = Provider(
  (ref) =>
      Dio()
        ..options = BaseOptions(
          baseUrl: "https://staging.curnectgate.com",
          headers: {'Content-Type': 'application/json'},
          extra: {'requiresAuth': true},
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
          InterceptorsWrapper(
            onError: (
              DioException error,
              ErrorInterceptorHandler handler,
            ) async {
              if (error.response?.statusCode == 401) {
                log("Session expired (401 detected)");

                // ✅ Correct way – just set the state
                ref.read(sessionExpiredProvider.notifier).expire();
                log(
                  "HERE WE CAN CHECK THE STATUS>" +
                      ref.read(sessionExpiredProvider).toString(),
                );
                // Optional: clear stored auth data immediately
              }
              return handler.next(error);
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              final prefs = SharedPrefsService();
              // final token = await ref.watch(accessTokenProvider.future);
              // already saved from login
              final cookie = await prefs.getSessionCookie();
              final token = await prefs.getUserToken();

              if (options.extra['requiresAuth'] == true) {
                log("Bearer Token Pass on the hearder:${token.toString()}");

                options.headers['Authorization'] = 'Bearer $token';

                if (cookie != null) {
                  options.headers['Cookie'] = cookie;
                }
              }

              return handler.next(options);
            },
            onResponse: (response, handler) async {
              // ✅ Refresh cookie if backend sends a new one
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