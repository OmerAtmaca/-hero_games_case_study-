import 'package:hero_games_case/data/models/services/key_value_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeyValueStore extends KeyValueStore {
  final SharedPreferences _preferences;

  SharedPreferencesKeyValueStore(this._preferences);

  @override
  bool containsKey(String key) => _preferences.containsKey(key);

  @override
  bool getBool(String key) => containsKey(key) && _preferences.getBool(key)!;

  @override
  double? getDouble(String key) =>
      containsKey(key) ? _preferences.getDouble(key) : null;

  @override
  int? getInt(String key) => containsKey(key) ? _preferences.getInt(key) : null;

  @override
  String? getString(String key) =>
      containsKey(key) ? _preferences.getString(key) : null;

  @override
  List<String>? getStringList(String key) =>
      containsKey(key) ? _preferences.getStringList(key) : null;

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> setBool(String key, bool value) =>
      _preferences.setBool(key, value);

  @override
  Future<bool> setDouble(String key, double value) =>
      _preferences.setDouble(key, value);

  @override
  Future<bool> setInt(String key, int value) => _preferences.setInt(key, value);

  @override
  Future<bool> setString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> value) =>
      _preferences.setStringList(key, value);

  @override
  Future<bool> clear() async {
    bool removed = true;
    for (final key in _preferences.getKeys()) {
      removed = removed | await _preferences.remove(key);
    }
    return removed;
  }
}
