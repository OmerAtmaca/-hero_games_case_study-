import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hero_games_case/data/models/users_model.dart';
import 'package:hero_games_case/data/repositories/auth_repository.dart';

import '../utils/bloc_common.dart';

part 'register_bloc.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default("") String pageError,
    @Default("") String error,
    @Default("") String email,
    @Default("") String firstName,
    @Default("") String lastName,
    @TimestampSerializer() required DateTime birthday,
    @Default("") String password,
    @Default("") String bio,
    @Default(false) bool isAuthValid,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(StateType.initial) StateType stateType,
    @Default(null) QuerySnapshot<UsersModel?>? dataUser,
  }) = _RegisterState;
}

class RegisterBloc extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterBloc(this._authRepository)
      : super(RegisterState(birthday: DateTime(2000, 1, 1)));

  void stateSuccess() {
    emit(state.copyWith(stateType: StateType.success));
  }

  void stateLoading() {
    emit(state.copyWith(stateType: StateType.loading));
  }

  void updateFirstName(String value) => emit(state.copyWith(firstName: value));

  void updateLastName(String value) => emit(state.copyWith(lastName: value));

  void isEmailValid(bool value) => emit(state.copyWith(isEmailValid: value));

  void updateEmail(String value) => emit(state.copyWith(email: value));

  void isPasswordValid(bool value) =>
      emit(state.copyWith(isPasswordValid: value));

  void updatePassword(String value) => emit(state.copyWith(password: value));

  void updateBirthDay(DateTime birthDate) {
    final timestamp = Timestamp.fromDate(birthDate);
    emit(state.copyWith(birthday: timestamp.toDate()));
  }

  bool isFormValid() => state.isEmailValid && state.isPasswordValid;

  Future register() async {
    print(state.firstName);
    print(state.lastName);
    print(state.birthday);
    print(state.email);
    print(state.password);
    print(state.firstName);
    try {
      await _authRepository
          .register(
              email: state.email,
              password: state.password,
              firstName: state.firstName,
              lastName: state.lastName,
              birthday: state.birthday,
              bio: state.bio)
          .then((value) {
        emit(state.copyWith(stateType: StateType.success));
      }).catchError((e) {
        emit(state.copyWith(stateType: StateType.error, error: e.toString()));
      });
    } on Exception catch (e) {
      print(e);
      emit(state.copyWith(stateType: StateType.error, error: e.toString()));
    }
  }
}
