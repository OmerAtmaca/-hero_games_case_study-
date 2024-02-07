import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hero_games_case/data/models/users_model.dart';
import 'package:hero_games_case/data/repositories/auth_repository.dart';
import 'package:hero_games_case/data/repositories/firebase_repository.dart';

import '../utils/bloc_common.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {UsersModel? userModel,
      @Default("") String hobby,
      @Default([]) List<String> hobbies,
      @Default(null) DocumentSnapshot<UsersModel?>? dataUser,
      @Default(StateType.initial) StateType stateType,
      @Default("") String error,
      @Default(false) bool isLoggedOut,
      @Default(false) bool isValid}) = _HomeState;
}

class HomeBloc extends Cubit<HomeState> {
  final FirebaseRepository _firebaseRepository;
  final AuthRepository _authRepository;

  void updateHobby(String value) => emit(state.copyWith(hobby: value));

  void isValid(bool value) => emit(state.copyWith(isValid: value));

  bool isFormValid() => state.isValid;

  HomeBloc(this._firebaseRepository, this._authRepository)
      : super(const HomeState());

  void stateSuccess() {
    emit(state.copyWith(stateType: StateType.success));
  }

  void stateLoading() {
    emit(state.copyWith(stateType: StateType.loading));
  }

  Future<UsersModel?> getData() async {
    try {
      emit(state.copyWith(stateType: StateType.loading));
      final datas =
          await _firebaseRepository.getUsers("appUsers", UsersModel());
      emit(state.copyWith(stateType: StateType.success, dataUser: datas));
      return datas.data();
    } on Exception catch (e) {
      emit(state.copyWith(stateType: StateType.error, error: ""));
      emit(state.copyWith(error: ""));
      throw e.toString();
    }
  }

  Future<void> logout() async {
    try {
      _authRepository.logOut();

      emit(state.copyWith(isLoggedOut: true));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void addData({required String data}) {
    _firebaseRepository.addHobby("appUsers", data);
    emit(state.copyWith(hobby: ""));
  }

  Future<void> deleteData(String doc) async {
    emit(state.copyWith(stateType: StateType.loading));
    await _firebaseRepository.removeUsers("users", doc);
    emit(state.copyWith(stateType: StateType.success));
  }
}
