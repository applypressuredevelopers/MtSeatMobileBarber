
/*import 'package:flutter_secure_storage/flutter_secure_storage.dart';*/
import 'package:shared_preferences/shared_preferences.dart';

class UserSecureStorage {
  /* static final _storage = const FlutterSecureStorage();*/

  static const _keyUserName = 'userName';
  static const _password = 'password';

  static Future setUseName(String userName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_keyUserName, userName);
      //return await _storage.write(key: _keyUserName, value: userName);
    } catch (e) {
      print(e);
    }
  }

  static Future setPassword(String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_password, password);
      // return await _storage.write(key: _password, value: password);
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> getPassword() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_password);
      // return await _storage.write(key: _password, value: password);
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> getUserName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyUserName);
      //return await _storage.write(key: _keyUserName, value: userName);
    } catch (e) {
      print(e);
    }
  }

  static Future delete() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.clear();
      //return await _storage.write(key: _keyUserName, value: userName);
    } catch (e) {
      print(e);
    }
  }
}
/* static Future delete() async => await _storage.deleteAll();

  /*static Future<String?> getUserName() async =>
      await _storage.read(key: _keyUserName);

  static Future<String?> getPassword() async =>
      await _storage.read(key: _password);*/
}*/
