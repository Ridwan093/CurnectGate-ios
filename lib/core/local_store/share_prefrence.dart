// shared_prefs_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const _keyAuthData = 'auth_data';
   static const _userName = 'User_name';

  Future<void> saveAuthData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAuthData, jsonEncode(data));
  }
  Future<void> saveSingleUserName(String usserName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, usserName);
  }
 Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
 
    final data = prefs.getString(_userName);
    return data;
  }
  Future<Map<String, dynamic>?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_keyAuthData);
    return data != null ? jsonDecode(data) : null;
  }

  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    log(_keyAuthData);
    await prefs.remove(_keyAuthData);
  }
}


