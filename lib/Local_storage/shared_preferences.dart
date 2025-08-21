import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _instance;

  static Future<SharedPreferences> getInstance() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  static Future<void> setStringList(String key, List<String> value) async {
    final instance = await getInstance();
    await instance.setStringList(key, value);
  }

  static Future<List<String>?> getStringList(String key) async {
    final instance = await getInstance();
    return instance.getStringList(key);
  }

  static Future<void> clear() async {
    await _instance?.clear();
  }
  
  static Future<void> remove(String key) async {
    await _instance?.remove(key);
  }
    
}