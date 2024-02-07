import 'package:hero_games_case/presentation/home/home_bloc.dart';
import 'package:hero_games_case/presentation/register/register_bloc.dart';
import 'package:hero_games_case/presentation/splash/splash_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/login/login_bloc.dart';

@module
abstract class BlocModule {
  @injectable
  HomeBloc get profileBloc;

  @injectable
  LoginBloc get loginBloc;

  @injectable
  RegisterBloc get mainTabBloc;

  @injectable
  SplashBloc get splashBloc;
}
