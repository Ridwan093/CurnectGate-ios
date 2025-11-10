// dio_client.dart

import 'dart:developer';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio()
    ..options = BaseOptions(
      extra: {'requiresAuth': true},
      baseUrl: "https://staging.curnectgate.com",
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Only proceed with token if this request requires auth
          // if (options.extra['requiresAuth'] == true) {
          //   final authData = await SharedPrefsService().getAuthData();
          //   final token = authData?['access_token'] as String?;
          //   // Extract token from auth data
          //   log(token!);
          //   options.headers['Authorization'] =
          //       'Bearer 29|aW3V4srP4NFmj3ztaBp5ntozekRSncfrzsg4b0zr48498c79';
          // }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired - clear auth data
            await SharedPrefsService().clearAuthData();
            // Optional: Add navigation to login screen
            // if (error.requestOptions.context != null) {
            //   Navigator.of(error.requestOptions.context)
            //     .pushReplacementNamed('/login');
            // }
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
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
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
    );
});
