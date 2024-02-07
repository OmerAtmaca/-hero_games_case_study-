import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hero_games_case/data/repositories/auth_repository.dart';
import 'package:hero_games_case/data/repositories/firebase_repository.dart';
import 'package:hero_games_case/presentation/utils/bloc_common.dart';

// ignore: depend_on_referenced_packages

part 'splash_bloc.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(StateType.success) StateType stateType,
    @Default(false) bool navigateToLogin,
    @Default(false) bool navigateToHome,
  }) = _SplashState;
}

class SplashBloc extends Cubit<SplashState> {
  final AuthRepository _authRepository;


  SplashBloc(this._authRepository)
      : super(const SplashState());

  Future<void> init() async {
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => navigate());
  }

  void navigate() async {
    if (_authRepository.isLoggedIn()) {
      emit(state.copyWith(navigateToHome: true));
    } else {
      emit(state.copyWith(navigateToLogin: true));
    }
  }
}
