import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? _sharedPrefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  // Get a String value from SharedPreferences
  Future<String?> getPref(String key) async {
    final SharedPreferences? prefs = _sharedPrefs;
    return prefs?.getString(key);
  }

  // Set a String value in SharedPreferences
  Future<void> setPref(String key, String value) async {
    final SharedPreferences? prefs = _sharedPrefs;
    await prefs?.setString(key, value);
  }

  // Set a list of Strings in SharedPreferences
  Future<void> setStringList(String key, List<String> value) async {
    final SharedPreferences? prefs = _sharedPrefs;
    await prefs?.setStringList(key, value);
  }

  // Get a list of Strings from SharedPreferences
  Future<List<String>> getStringList(String key) async {
    final SharedPreferences? prefs = _sharedPrefs;
    return prefs?.getStringList(key) ?? [];
  }

  // Remove a key from SharedPreferences
  Future<void> removePref(String key) async {
    final SharedPreferences? prefs = _sharedPrefs;
    await prefs?.remove(key);
  }
}

// Instantiate SharedPrefs
final sharedPrefs = SharedPrefs();
