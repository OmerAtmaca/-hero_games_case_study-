import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/auth_repository.dart';
import '../utils/bloc_common.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default("") String email,
    @Default("") String password,
    @Default("") String error,
    @Default("") String phoneNumber,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isSign,
    @Default(StateType.initial) StateType stateType,
  }) = _LoginState;
}

class LoginBloc extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  void isEmailValid(bool value) => emit(state.copyWith(isEmailValid: value));

  void isPasswordValid(bool value) =>
      emit(state.copyWith(isPasswordValid: value));

  void isSignIn(bool value) => emit(state.copyWith(isSign: value));

  void updateEmailNumber(String value) => emit(state.copyWith(email: value));

  void updatePasswordNumber(String value) =>
      emit(state.copyWith(password: value));

  bool isFormValid() => state.isEmailValid && state.isPasswordValid;

  LoginBloc(this._authRepository) : super(const LoginState());

  Future auth() async {
    try {
      final response = await _authRepository
          .signIn(email: state.email, password: state.password)
          .then((value) => null)
          .catchError((e) {
        emit(state.copyWith(stateType: StateType.error, error: e.toString()));
      });
      final idToken = await response?.getIdToken();
      _authRepository.setAccessToken(idToken ?? "");
      if (response != null) {
        isSignIn(true);
        emit(state.copyWith(stateType: StateType.success));
      }
    } on Exception catch (e) {
      emit(state.copyWith(stateType: StateType.error, error: e.toString()));
      emit(state.copyWith(error: ""));
    }
  }
}
