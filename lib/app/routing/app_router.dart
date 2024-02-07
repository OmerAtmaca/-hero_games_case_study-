import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hero_games_case/presentation/home/home_page.dart';
import 'package:hero_games_case/presentation/login/login_page.dart';
import 'package:hero_games_case/presentation/register/register_page.dart';
import 'package:hero_games_case/presentation/splash/splash_page.dart';

import 'app_navigator.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route,Screen',
    routes: <AutoRoute>[
      AutoRoute(
        page: HomePage,
        path: AppNavigator.homePath,
        name: AppNavigator.homePath,
      ),
      AutoRoute(
        page: RegisterPage,
        path: AppNavigator.registerPath,
        name: AppNavigator.registerPath,
      ),
      AutoRoute(
        page: LoginPage,
        path: AppNavigator.loginPath,
        name: AppNavigator.loginPath,
      ),
      AutoRoute(
        page: SplashPage,
        path: AppNavigator.splashPath,
        initial: true,
      ),
    ])
class AppRouter extends _$AppRouter {
  AppRouter({required GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey);
}
