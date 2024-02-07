import 'package:get_it/get_it.dart';
import 'package:hero_games_case/config/app_config.dart';
import 'package:hero_games_case/config/di/di.config.dart';
import 'package:injectable/injectable.dart';

final GetIt _getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDI(AppConfig appConfig) async {
  _getIt.registerSingleton<AppConfig>(appConfig);
  await _getIt.init();
}

T inject<T extends Object>() => _getIt.get<T>();
