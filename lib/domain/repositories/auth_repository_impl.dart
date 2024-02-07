import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/services/user_model_local_storage_service.dart';
import '../../data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final UserModelLocalStorageService _localStorageService;

  AuthRepositoryImpl(
      this._firebaseFirestore, this._firebaseAuth, this._localStorageService);

  @override
  Future<void> register({
    required String firstName,
    required String lastName,
    required DateTime birthday,
    required String bio,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        await _firebaseFirestore.doc("appUsers/${user.uid}").set({
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "birthday": birthday,
          "bio": bio,
        });
      } else {
        throw Exception("Kullanıcı oluşturulamadı!");
      }
    } catch (e) {
      final errorMessage = e.toString();
      if (errorMessage.contains("email-already-in-use")) {
        throw Exception("Bu e-posta adresi zaten bir hesaba kayıtlı!");
      } else {
        throw Exception(errorMessage);
      }
    }
  }

  @override
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw Exception("Kullanıcı Bulunamadı !!!");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw Exception("Şifre Hatalı !!!");
      }
    }
    return null;
  }

  @override
  Future<void> logOut() async {
    _localStorageService.logOut();
    _firebaseAuth.signOut();
  }

  @override
  Future<bool> setAccessToken(String accessToken) =>
      _localStorageService.setAccessToken(accessToken);

  @override
  Future<bool> setRefreshToken(String refreshToken) =>
      _localStorageService.setRefreshToken(refreshToken);

  @override
  Future<bool> setFcmToken(String fcmToken) =>
      _localStorageService.setFcmToken(fcmToken);

  @override
  bool isLoggedIn() => _localStorageService.getAccessToken() != "";

  @override
  Future<bool> logout() {
    _localStorageService.logOut();
    return Future.value(true);
  }
}
