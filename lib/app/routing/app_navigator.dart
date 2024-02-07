import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

abstract class AppNavigator {
  static const String homePath = 'homePath';
  static const String registerPath = 'registerPath';
  static const String loginPath = 'loginPath';
  static const String splashPath = 'splashPath';

  Future<dynamic> pushNamed(String route);

  void pushNamedReplaced(String route);

  void navigateNamed(String route);

  Future<dynamic> pushRoute(PageRouteInfo route);

  void pushRouteReplace(PageRouteInfo route);

  void pushRouteRemoveUntil(PageRouteInfo route);

  void navigateRoute(PageRouteInfo route);

  void popStack(BuildContext context, {dynamic result});

  void showInfoScaffold(
      BuildContext context, VoidCallback onPressed, String title);
}
