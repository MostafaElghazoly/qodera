import 'package:localstorage/localstorage.dart';

class LocalStorageHelper {
  static const _key = "LOCAL_STORAGE";

  late LocalStorage _localStorage;

  LocalStorageHelper._privateConstructor();

  static final LocalStorageHelper _instance =
      LocalStorageHelper._privateConstructor();

  factory LocalStorageHelper() {
    return _instance;
  }

  Future<void> _initLocalStorage() async {
    _localStorage = LocalStorage(_key);
    await _localStorage.ready;
  }

  Future<void> init() async {
    await _initLocalStorage();
  }

  Future<void> setItem({required String key, required var data}) async {
    await _localStorage.setItem(key, data);
  }

  dynamic getItem({required String key}) {
    return _localStorage.getItem(key);
  }

  Future<void> clear() {
    return _localStorage.clear();
  }
}
