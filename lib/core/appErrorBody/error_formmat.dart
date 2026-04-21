



import 'package:dio/dio.dart';

String formatErrorMessage(Object error) {
  // If it's not a DioException, just return as string
  if (error is! DioException) {
    return error.toString();
  }

  final dioError = error;

  // === 1. Backend Error (Server responded with error status) ===
  if (dioError.response != null) {
    // Try to extract the message from response body first (best case)
    final responseData = dioError.response?.data;

    String? backendMessage;

    if (responseData is Map<String, dynamic>) {
      backendMessage = responseData['message'] ??
                       responseData['error'] ??
                       responseData['msg'];
    } else if (responseData is String) {
      backendMessage = responseData;
    }

    // If backend sent a message, show it fully (this is what you want)
    if (backendMessage != null && backendMessage.isNotEmpty) {
      return backendMessage.trim();
    }

    // Fallback: show status code + default message
    final statusCode = dioError.response?.statusCode;
    return "Server error ($statusCode). ${dioError.response?.statusMessage ?? ''}";
  }

  // === 2. Pure Network / Dio Client Errors (no response from server) ===
  switch (dioError.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return "Request timed out. Please check your internet connection.";

    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return "No internet connection or server unreachable. Please check your network.";

    case DioExceptionType.cancel:
      return "Request was cancelled.";

    default:
      return "Something went wrong. Please check your connection and try again.";
  }
}