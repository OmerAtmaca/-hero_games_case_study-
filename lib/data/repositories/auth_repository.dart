import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signIn({
    required String email,
    required String password,
  });
  Future<void> register(
      {required String firstName,
      required String lastName,
      required DateTime birthday,
      required String bio,
      required String email,
      required String password});

  Future<void> logOut();

  Future<bool> setAccessToken(String accessToken);

  Future<bool> setFcmToken(String accessToken);

  Future<bool> setRefreshToken(String refreshToken);

  bool isLoggedIn();

  Future<bool> logout();
}
