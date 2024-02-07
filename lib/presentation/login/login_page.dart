import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_games_case/app/routing/app_router.dart';
import 'package:hero_games_case/presentation/common_widgets/rounded_cta_button.dart';
import 'package:hero_games_case/presentation/utils/custom_colors.dart';
import 'package:hero_games_case/presentation/utils/dimens.dart';
import 'package:hero_games_case/presentation/utils/ext_utils.dart';
import 'package:hero_games_case/presentation/utils/form_fields.dart';

import '../../app/routing/app_navigator.dart';
import '../../config/di/di.dart';
import '../utils/bloc_common.dart';
import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  final navigator = inject<AppNavigator>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<LoginBloc>(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = context.read<LoginBloc>();
            return SafeArea(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/hobbies_logo.png",
                    fit: BoxFit.fill,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2)),
                  ),
                  Positioned(
                    top: 250,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: context.screenHeight() - 200,
                      decoration:
                          const BoxDecoration(color: CustomColors.astral),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.horizontalOffset),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: CustomColors.superNova,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.borderRadius)),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(Dimens.horizontalOffset),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: Dimens.verticalOffset),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/hero_games_logo.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Hoş geldiniz",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.tarawera,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                EmailFormField(
                                  text: "",
                                  isValid: (value) => bloc.isEmailValid(value),
                                  onChanged: (value) =>
                                      bloc.updateEmailNumber(value),
                                ),
                                PasswordFormField(
                                  text: "",
                                  isValid: (value) =>
                                      bloc.isPasswordValid(value),
                                  onChanged: (value) =>
                                      bloc.updatePasswordNumber(value),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundedCtaButton(
                                      horizontalPadding: 10,
                                      width: 100,
                                      height: 40,
                                      title: "Kayıt Ol",
                                      textSize: 10,
                                      icon: "assets/register.png",
                                      iconHeight: 20,
                                      iconWidth: 20,
                                      onClicked: () {
                                        navigator
                                            .pushRoute(const RegisterPath());
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    RoundedCtaButton(
                                      horizontalPadding: 10,
                                      width: 100,
                                      height: 40,
                                      title: "Giriş Yap",
                                      textSize: 10,
                                      icon: "assets/login.png",
                                      isActive: bloc.isFormValid(),
                                      onClicked: () async {
                                        if (bloc.isFormValid()) {
                                          await bloc.auth();
                                          if (state.stateType ==
                                              StateType.success) {
                                            if (state.isSign) {
                                              navigator.pushRoute(HomePath());
                                            }
                                          } else if (state.stateType ==
                                              StateType.error) {
                                            navigator.showInfoScaffold(
                                                context, () {}, state.error);
                                          }
                                        } else {
                                          navigator.showInfoScaffold(
                                              context,
                                              () {},
                                              "Lütfen alanları kontrol ediniz!");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Dimens.verticalOffset),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
