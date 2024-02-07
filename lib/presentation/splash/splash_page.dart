import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_games_case/config/di/di.dart';
import 'package:hero_games_case/presentation/utils/ext_utils.dart';

import '../../app/routing/app_navigator.dart';
import '../utils/custom_colors.dart';
import 'splash_bloc.dart';

class SplashPage extends StatelessWidget {
  final navigator = inject<AppNavigator>();

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<SplashBloc>()..init(),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.navigateToLogin) {
            navigator.pushNamedReplaced(AppNavigator.loginPath);
          } else if (state.navigateToHome) {
            navigator.pushNamedReplaced(AppNavigator.homePath);
          }
        },
        child: Scaffold(
          backgroundColor: CustomColors.dazzledBlue,
          body: Center(
            child: Image.asset(
              "assets/hero_games_logo.png",
              width: context.screenWidth() / 2.5,
            ),
          ),
        ),
      ),
    );
  }
}
