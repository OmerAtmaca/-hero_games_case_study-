import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hero_games_case/app/routing/app_router.dart';
import 'package:hero_games_case/config/di/di.dart';
import 'package:hero_games_case/presentation/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = inject<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      theme: defaultTheme(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
