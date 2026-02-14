import 'dart:io';

import 'package:dio/dio.dart';

String mapDioErrorToMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timed out. Please try again.";

    case DioExceptionType.sendTimeout:
      return "Request took too long to send. Check your internet.";

    case DioExceptionType.receiveTimeout:
      return "Server is taking too long to respond.";

    case DioExceptionType.badCertificate:
      return "Secure connection failed.";

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;

      if (statusCode == 400) return "Invalid request.";
      if (statusCode == 401) return "Unauthorized. Please log in again.";
      if (statusCode == 403) return "Access denied.";
      // if (statusCode == 404) return "Service not found.";
      if (statusCode == 422)
        return e.response?.data['message'] ?? "Invalid data.";
      if (statusCode == 500) return "Server error. Please try later.";

      return e.response?.data['message'] ?? "Unexpected server error.";

    case DioExceptionType.cancel:
      return "Request was cancelled.";

    case DioExceptionType.connectionError:
      return "No internet connection.";

    case DioExceptionType.unknown:
      if (e.error is SocketException) {
        return "No internet connection.";
      }
      return "Something went wrong. Please try again.";
  }
}
