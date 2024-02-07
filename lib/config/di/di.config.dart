// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:dio/dio.dart' as _i12;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hero_games_case/app/routing/app_navigator.dart' as _i8;
import 'package:hero_games_case/app/routing/app_navigator_auto_route.dart'
    as _i19;
import 'package:hero_games_case/app/routing/app_router.dart' as _i3;
import 'package:hero_games_case/config/di/blocs_module.dart' as _i27;
import 'package:hero_games_case/config/di/firebase_module.dart' as _i21;
import 'package:hero_games_case/config/di/main_module.dart' as _i18;
import 'package:hero_games_case/config/di/networking_service.dart' as _i26;
import 'package:hero_games_case/config/di/repository_module.dart' as _i23;
import 'package:hero_games_case/config/di/service_module.dart' as _i22;
import 'package:hero_games_case/data/models/services/key_value_store.dart'
    as _i9;
import 'package:hero_games_case/data/models/services/shared_preferences_key_value_store.dart'
    as _i20;
import 'package:hero_games_case/data/models/services/user_model_local_storage_service.dart'
    as _i10;
import 'package:hero_games_case/data/repositories/auth_repository.dart' as _i11;
import 'package:hero_games_case/data/repositories/firebase_repository.dart'
    as _i13;
import 'package:hero_games_case/domain/repositories/auth_repository_impl.dart'
    as _i24;
import 'package:hero_games_case/domain/repositories/firebase_repository_Impl.dart'
    as _i25;
import 'package:hero_games_case/presentation/home/home_bloc.dart' as _i14;
import 'package:hero_games_case/presentation/login/login_bloc.dart' as _i15;
import 'package:hero_games_case/presentation/register/register_bloc.dart'
    as _i16;
import 'package:hero_games_case/presentation/splash/splash_bloc.dart' as _i17;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final mainModule = _$MainModule(this);
    final firebaseModule = _$FirebaseModule();
    final serviceModule = _$ServiceModule(this);
    final repositoryModule = _$RepositoryModule(this);
    final networkingModule = _$NetworkingModule();
    final blocModule = _$BlocModule(this);
    gh.lazySingleton<_i3.AppRouter>(() => mainModule.getAppRouter());
    gh.factory<_i4.FirebaseAuth>(() => firebaseModule.auth);
    gh.factory<_i5.FirebaseFirestore>(() => firebaseModule.store);
    gh.singleton<_i6.FirebaseMessaging>(firebaseModule.getFirebaseMessaging());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => mainModule.getSharedPreferences(),
      preResolve: true,
    );
    gh.singleton<_i8.AppNavigator>(mainModule.navigator);
    gh.factory<_i9.KeyValueStore>(
        () => mainModule.sharedPreferencesKeyValueStore);
    gh.singleton<_i10.UserModelLocalStorageService>(
        serviceModule.localStorageService);
    gh.lazySingleton<_i11.AuthRepository>(
        () => repositoryModule.authRepository);
    gh.lazySingleton<_i12.Dio>(
        () => networkingModule.getDio(gh<_i10.UserModelLocalStorageService>()));
    gh.lazySingleton<_i13.FirebaseRepository>(
        () => repositoryModule.firebaseRepository);
    gh.factory<_i14.HomeBloc>(() => blocModule.profileBloc);
    gh.factory<_i15.LoginBloc>(() => blocModule.loginBloc);
    gh.factory<_i16.RegisterBloc>(() => blocModule.mainTabBloc);
    gh.factory<_i17.SplashBloc>(() => blocModule.splashBloc);
    return this;
  }
}

class _$MainModule extends _i18.MainModule {
  _$MainModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i19.AutoRouteNavigator get navigator =>
      _i19.AutoRouteNavigator(_getIt<_i3.AppRouter>());

  @override
  _i20.SharedPreferencesKeyValueStore get sharedPreferencesKeyValueStore =>
      _i20.SharedPreferencesKeyValueStore(_getIt<_i7.SharedPreferences>());
}

class _$FirebaseModule extends _i21.FirebaseModule {}

class _$ServiceModule extends _i22.ServiceModule {
  _$ServiceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i10.UserModelLocalStorageService get localStorageService =>
      _i10.UserModelLocalStorageService(_getIt<_i9.KeyValueStore>());
}

class _$RepositoryModule extends _i23.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i24.AuthRepositoryImpl get authRepository => _i24.AuthRepositoryImpl(
        _getIt<_i5.FirebaseFirestore>(),
        _getIt<_i4.FirebaseAuth>(),
        _getIt<_i10.UserModelLocalStorageService>(),
      );

  @override
  _i25.FirebaseRepositoryImpl get firebaseRepository =>
      _i25.FirebaseRepositoryImpl(
        _getIt<_i5.FirebaseFirestore>(),
        _getIt<_i11.AuthRepository>(),
        _getIt<_i4.FirebaseAuth>(),
      );
}

class _$NetworkingModule extends _i26.NetworkingModule {}

class _$BlocModule extends _i27.BlocModule {
  _$BlocModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i14.HomeBloc get profileBloc => _i14.HomeBloc(
        _getIt<_i13.FirebaseRepository>(),
        _getIt<_i11.AuthRepository>(),
      );

  @override
  _i15.LoginBloc get loginBloc => _i15.LoginBloc(_getIt<_i11.AuthRepository>());

  @override
  _i16.RegisterBloc get mainTabBloc =>
      _i16.RegisterBloc(_getIt<_i11.AuthRepository>());

  @override
  _i17.SplashBloc get splashBloc =>
      _i17.SplashBloc(_getIt<_i11.AuthRepository>());
}
