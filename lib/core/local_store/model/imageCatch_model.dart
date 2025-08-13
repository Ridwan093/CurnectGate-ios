import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ImageCacheService {
  static Future<void> saveImage(String url, Uint8List bytes) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(url, base64Encode(bytes));
      log('Image saved to cache: $url');
    } catch (e) {
      log('Error saving image: $e');
    }
  }

  static Future<Uint8List?> getCachedImageBytes(String url) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final imageString = prefs.getString(url);
      return imageString != null ? base64Decode(imageString) : null;
    } catch (e) {
      log('Error loading cached image: $e');
      return null;
    }
  }

  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
