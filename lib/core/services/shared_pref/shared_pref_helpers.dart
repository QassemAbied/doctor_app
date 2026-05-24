import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();


  static Future<void> removeData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<Null> setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static Future<void> clearAllSecuredData() async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}