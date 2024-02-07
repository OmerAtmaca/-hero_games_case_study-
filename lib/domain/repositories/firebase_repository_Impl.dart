import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_games_case/data/api_services/firebase_service/firebase_base_model.dart';
import 'package:hero_games_case/data/models/users_model.dart';
import 'package:hero_games_case/data/repositories/firebase_repository.dart';

import '../../data/repositories/auth_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final AuthRepository _authRepository;
  FirebaseRepositoryImpl(
      this._firebaseFirestore, this._authRepository, this._firebaseAuth);

  @override
  Future<DocumentSnapshot<UsersModel?>> getUsers(
      String path, FirebaseBaseModel<UsersModel> model) {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final userData =
          _firebaseFirestore.collection(path).doc(currentUser?.uid);
      final response = userData.withConverter(
        fromFirestore: (snapshot, options) {
          return model.fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          if (value == null) throw Exception("");
          return model.toJson();
        },
      ).get();

      return response;
    } on FirebaseAuthException catch (e) {
      print("We failed ${e.message}");
      throw Exception(e.message);
    }
  }

  @override
  Future<void> addHobby(String path, String data) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final docRef = _firebaseFirestore.collection(path).doc(currentUser?.uid);

      // Firestore'dan mevcut veriyi al
      final docSnapshot = await docRef.get();
      final existingHobbies =
          List<String>.from(docSnapshot.data()?['hobbies'] ?? []);

      // Yeni veriyi listeye ekle
      existingHobbies.add(data);

      // Güncellenmiş listeyi Firestore'a kaydet
      await docRef.update({"hobbies": existingHobbies}).onError(
          (e, _) => print("Error writing document: $e"));
    } on FirebaseAuthException catch (e) {
      print("We failed ${e.message}");
      throw Exception(e.message);
    }
  }

  @override
  Future<void> setUsers(String path, String id, UsersModel newModel,
      {bool? isUpdate}) async {
    try {
      final db = _firebaseFirestore.collection(path);
      final dbRef = db.withConverter(
        fromFirestore: (snapshot, options) {
          return newModel.fromFirebase(snapshot);
        },
        toFirestore: (value, options) {
          if (value == null) throw Exception("");
          return newModel.toJson();
        },
      ).doc(id);

      await dbRef.set(
          newModel, isUpdate ?? false ? SetOptions(merge: true) : null);
    } on FirebaseAuthException catch (e) {
      print("We failed ${e.message}");
      throw Exception(e.message);
    }
  }

  @override
  Future<void> removeUsers(String path, String doc) async {
    await _firebaseFirestore.collection(path).doc(doc).delete();
  }
}
