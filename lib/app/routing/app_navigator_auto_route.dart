import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_navigator.dart';
import 'app_router.dart';

class AutoRouteNavigator implements AppNavigator {
  final AppRouter _appRouter;

  AutoRouteNavigator(this._appRouter);

  @override
  Future<dynamic> pushNamed(String route) async =>
      await _appRouter.pushNamed(route);

  @override
  void navigateNamed(String route) => _appRouter.navigateNamed(route);

  @override
  Future<dynamic> pushRoute(PageRouteInfo<dynamic> route) =>
      _appRouter.push(route);

  @override
  void navigateRoute(PageRouteInfo<dynamic> route) =>
      _appRouter.navigate(route);

  @override
  void popStack(BuildContext context, {dynamic result}) =>
      Navigator.of(context).pop(result);

  @override
  void pushNamedReplaced(String route) => _appRouter.replaceNamed(route);

  @override
  void pushRouteReplace(PageRouteInfo route) => _appRouter.replace(route);

  @override
  void pushRouteRemoveUntil(PageRouteInfo route) =>
      _appRouter.replaceAll([route]);

  @override
  void showInfoScaffold(
      BuildContext context, VoidCallback onPressed, String title) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        action: SnackBarAction(onPressed: onPressed, label: 'OK'),
      ),
    );
  }
}
