import 'package:ecommerce_project_main/data/di/di.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManger {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static final SharedPreferences _sharedPref = locator.get();
  static void saveToken(String token) async {
    _sharedPref.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static String readAuth() {
    return _sharedPref.getString('access_token') ?? '';
  }

  static void logout() {
    _sharedPref.clear();
    authChangeNotifire.value = null;
  }

  static bool isLogedin() {
    String token = readAuth();
    return token.isEmpty;
  }
}
