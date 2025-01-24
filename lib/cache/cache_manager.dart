import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';

class CacheManager {
  // Save login data to cache
  Future<void> storeLoginInfo(Login login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginJson = json.encode(login.toJson()); // Serialize Login object to JSON string
    await prefs.setString('login_info', loginJson);
  }

  // Retrieve login data from cache
  Future<Login?> getLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginJson = prefs.getString('login_info'); // Get JSON string from cache

    if (loginJson != null) {
      return Login.fromJson(json.decode(loginJson)); // Deserialize JSON back to Login object
    }

    return null; // Return null if no login info is found
  }

  // Remove login data from cache
  Future<void> clearLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_info');
  }
}
