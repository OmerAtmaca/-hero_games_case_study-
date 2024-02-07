import 'dart:convert';

import 'package:hero_games_case/data/models/services/key_value_store.dart';
import 'package:hero_games_case/data/models/services/shared_preferences_keys.dart';
import 'package:hero_games_case/data/models/users_model.dart';


class UserModelLocalStorageService {
  final KeyValueStore _keyValueStore;

  UserModelLocalStorageService(this._keyValueStore);

  UsersModel? getUserModel() {
    final userModel = _keyValueStore.getString(SharedPreferencesKeys.userModel);
    if (userModel == null) {
      return null;
    }
    return UsersModel.fromJson(json.decode(userModel));
  }

  Future<bool> setUserModel(UsersModel value) => _keyValueStore.setString(
      SharedPreferencesKeys.userModel, json.encode(value.toJson()));

  String getAccessToken() =>
      _keyValueStore.getString(SharedPreferencesKeys.accessToken) ?? "";

  Future<bool> setAccessToken(String value) =>
      _keyValueStore.setString(SharedPreferencesKeys.accessToken, value);

  String getFcmToken() =>
      _keyValueStore.getString(SharedPreferencesKeys.fcmToken) ?? "";

  Future<bool> setFcmToken(String? value) =>
      _keyValueStore.setString(SharedPreferencesKeys.fcmToken, value ?? "");

  String getRefreshToken() =>
      _keyValueStore.getString(SharedPreferencesKeys.refreshToken) ?? "";

  Future<bool> setRefreshToken(String value) =>
      _keyValueStore.setString(SharedPreferencesKeys.refreshToken, value);

  void logOut() {
    _keyValueStore.clear();
  }
}
