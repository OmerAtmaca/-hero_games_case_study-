import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hero_games_case/presentation/utils/ext_utils.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/services/user_model_local_storage_service.dart';

@module
abstract class NetworkingModule {
  @lazySingleton
  
  Dio getDio(
    UserModelLocalStorageService localStorageService,
  ) {
    final Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, interceptor) async {
          //TODO Buradaki kontrol check edilmeli
          if (options.path.contains("amazonaws.com")) {
            interceptor.next(options);
            return;
          }
          final token = localStorageService.getAccessToken().toBearer();
          options.headers["app-name"] = "hero_games_case_study";
          options.headers["Authorization"] = token;
          options.headers["platform"] = Platform.isIOS ? "IOS" : "ANDROID";
          options.headers["locale"] = "TUR";
          options.headers["fcm-token"] = localStorageService.getFcmToken();
          options.headers["country-code"] = "TUR";
          interceptor.next(options);
        },
      ),
    );
    if (!kReleaseMode) {
      dio.interceptors;
    }

    return dio;
  }
}
