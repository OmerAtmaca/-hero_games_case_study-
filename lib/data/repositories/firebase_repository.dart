import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hero_games_case/data/api_services/firebase_service/firebase_base_model.dart';

import '../models/users_model.dart';

abstract class FirebaseRepository {
  Future<DocumentSnapshot<UsersModel?>> getUsers(
      String path, FirebaseBaseModel<UsersModel> model);

  void setUsers(String path, String id, UsersModel newModel, {bool? isUpdate});

  Future<void> addHobby(String path, String data);

  Future<void> removeUsers(String path, String doc);
}
