import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/signOut/provider/authProvider.dart';

final dioProvider = Provider(
  (ref) =>
      Dio()
        ..options = BaseOptions(
          baseUrl: "https://api.curnectgate.com/api/v1/",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          extra: {'requiresAuth': true},
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
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

                ref.read(sessionExpiredProvider.notifier).expire();
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
                if (token != null && token.isNotEmpty) {
                  options.headers['Authorization'] = 'Bearer $token';
                } else if (cookie != null && cookie.isNotEmpty) {
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
        ..interceptors.add(LogInterceptor(error: true)),
);





