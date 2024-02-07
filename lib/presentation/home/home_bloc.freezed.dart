// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  UsersModel? get userModel => throw _privateConstructorUsedError;
  String get hobby => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;
  DocumentSnapshot<UsersModel?>? get dataUser =>
      throw _privateConstructorUsedError;
  StateType get stateType => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isLoggedOut => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {UsersModel? userModel,
      String hobby,
      List<String> hobbies,
      DocumentSnapshot<UsersModel?>? dataUser,
      StateType stateType,
      String error,
      bool isLoggedOut,
      bool isValid});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
    Object? hobby = null,
    Object? hobbies = null,
    Object? dataUser = freezed,
    Object? stateType = null,
    Object? error = null,
    Object? isLoggedOut = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UsersModel?,
      hobby: null == hobby
          ? _value.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataUser: freezed == dataUser
          ? _value.dataUser
          : dataUser // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<UsersModel?>?,
      stateType: null == stateType
          ? _value.stateType
          : stateType // ignore: cast_nullable_to_non_nullable
              as StateType,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsersModel? userModel,
      String hobby,
      List<String> hobbies,
      DocumentSnapshot<UsersModel?>? dataUser,
      StateType stateType,
      String error,
      bool isLoggedOut,
      bool isValid});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
    Object? hobby = null,
    Object? hobbies = null,
    Object? dataUser = freezed,
    Object? stateType = null,
    Object? error = null,
    Object? isLoggedOut = null,
    Object? isValid = null,
  }) {
    return _then(_$HomeStateImpl(
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UsersModel?,
      hobby: null == hobby
          ? _value.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value._hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataUser: freezed == dataUser
          ? _value.dataUser
          : dataUser // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<UsersModel?>?,
      stateType: null == stateType
          ? _value.stateType
          : stateType // ignore: cast_nullable_to_non_nullable
              as StateType,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.userModel,
      this.hobby = "",
      final List<String> hobbies = const [],
      this.dataUser = null,
      this.stateType = StateType.initial,
      this.error = "",
      this.isLoggedOut = false,
      this.isValid = false})
      : _hobbies = hobbies;

  @override
  final UsersModel? userModel;
  @override
  @JsonKey()
  final String hobby;
  final List<String> _hobbies;
  @override
  @JsonKey()
  List<String> get hobbies {
    if (_hobbies is EqualUnmodifiableListView) return _hobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbies);
  }

  @override
  @JsonKey()
  final DocumentSnapshot<UsersModel?>? dataUser;
  @override
  @JsonKey()
  final StateType stateType;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool isLoggedOut;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'HomeState(userModel: $userModel, hobby: $hobby, hobbies: $hobbies, dataUser: $dataUser, stateType: $stateType, error: $error, isLoggedOut: $isLoggedOut, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies) &&
            (identical(other.dataUser, dataUser) ||
                other.dataUser == dataUser) &&
            (identical(other.stateType, stateType) ||
                other.stateType == stateType) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoggedOut, isLoggedOut) ||
                other.isLoggedOut == isLoggedOut) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userModel,
      hobby,
      const DeepCollectionEquality().hash(_hobbies),
      dataUser,
      stateType,
      error,
      isLoggedOut,
      isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final UsersModel? userModel,
      final String hobby,
      final List<String> hobbies,
      final DocumentSnapshot<UsersModel?>? dataUser,
      final StateType stateType,
      final String error,
      final bool isLoggedOut,
      final bool isValid}) = _$HomeStateImpl;

  @override
  UsersModel? get userModel;
  @override
  String get hobby;
  @override
  List<String> get hobbies;
  @override
  DocumentSnapshot<UsersModel?>? get dataUser;
  @override
  StateType get stateType;
  @override
  String get error;
  @override
  bool get isLoggedOut;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
