// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePath.name: (routeData) {
      final args =
          routeData.argsAs<HomePathArgs>(orElse: () => const HomePathArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    RegisterPath.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    LoginPath.name: (routeData) {
      final args =
          routeData.argsAs<LoginPathArgs>(orElse: () => const LoginPathArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    SplashPageRoute.name: (routeData) {
      final args = routeData.argsAs<SplashPageRouteArgs>(
          orElse: () => const SplashPageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SplashPage(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splashPath',
          fullMatch: true,
        ),
        RouteConfig(
          HomePath.name,
          path: 'homePath',
        ),
        RouteConfig(
          RegisterPath.name,
          path: 'registerPath',
        ),
        RouteConfig(
          LoginPath.name,
          path: 'loginPath',
        ),
        RouteConfig(
          SplashPageRoute.name,
          path: 'splashPath',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomePath extends PageRouteInfo<HomePathArgs> {
  HomePath({Key? key})
      : super(
          HomePath.name,
          path: 'homePath',
          args: HomePathArgs(key: key),
        );

  static const String name = 'HomePath';
}

class HomePathArgs {
  const HomePathArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomePathArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterPath extends PageRouteInfo<void> {
  const RegisterPath()
      : super(
          RegisterPath.name,
          path: 'registerPath',
        );

  static const String name = 'RegisterPath';
}

/// generated route for
/// [LoginPage]
class LoginPath extends PageRouteInfo<LoginPathArgs> {
  LoginPath({Key? key})
      : super(
          LoginPath.name,
          path: 'loginPath',
          args: LoginPathArgs(key: key),
        );

  static const String name = 'LoginPath';
}

class LoginPathArgs {
  const LoginPathArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginPathArgs{key: $key}';
  }
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<SplashPageRouteArgs> {
  SplashPageRoute({Key? key})
      : super(
          SplashPageRoute.name,
          path: 'splashPath',
          args: SplashPageRouteArgs(key: key),
        );

  static const String name = 'SplashPageRoute';
}

class SplashPageRouteArgs {
  const SplashPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashPageRouteArgs{key: $key}';
  }
}
