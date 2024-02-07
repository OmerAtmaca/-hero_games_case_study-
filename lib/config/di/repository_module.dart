import 'package:hero_games_case/data/repositories/firebase_repository.dart';
import 'package:hero_games_case/domain/repositories/auth_repository_impl.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/auth_repository.dart';
import '../../domain/repositories/firebase_repository_Impl.dart';

@module
abstract class RepositoryModule {
  @LazySingleton(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  @LazySingleton(as: FirebaseRepository)
  FirebaseRepositoryImpl get firebaseRepository;
}
