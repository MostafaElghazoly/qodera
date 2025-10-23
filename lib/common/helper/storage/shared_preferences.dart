import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesHelper._privateConstructor();

  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._privateConstructor();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> init() async {
    await _initSharedPreferences();
  }

  void saveString(String key, String value) {
    _sharedPreferences.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  void saveBoolean(String key, bool value) {
    _sharedPreferences.setBool(key, value);
  }

  bool? getBoolean(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<bool> clearCache() async {
    return _sharedPreferences.clear();
  }

  Future<bool> remove(String key) async {
    return _sharedPreferences.remove(key);
  }
}
