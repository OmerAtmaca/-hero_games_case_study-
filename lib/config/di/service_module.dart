
import 'package:injectable/injectable.dart';
import '../../data/models/services/user_model_local_storage_service.dart';

@module
abstract class ServiceModule {
  @singleton
  UserModelLocalStorageService get localStorageService;
}
