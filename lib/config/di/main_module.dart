import 'package:flutter/material.dart';
import 'package:hero_games_case/app/routing/app_navigator.dart';
import 'package:hero_games_case/app/routing/app_navigator_auto_route.dart';
import 'package:hero_games_case/app/routing/app_router.dart';
import 'package:hero_games_case/data/models/services/key_value_store.dart';
import 'package:hero_games_case/data/models/services/shared_preferences_key_value_store.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class MainModule {
  @Injectable(as: KeyValueStore)
  SharedPreferencesKeyValueStore get sharedPreferencesKeyValueStore;

  @preResolve
  Future<SharedPreferences> getSharedPreferences() async =>
      SharedPreferences.getInstance();

  @Singleton(as: AppNavigator)
  AutoRouteNavigator get navigator;

  @LazySingleton()
  AppRouter getAppRouter() =>
      AppRouter(navigatorKey: GlobalKey<NavigatorState>());
}
