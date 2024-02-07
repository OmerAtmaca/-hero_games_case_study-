import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_games_case/app/routing/app_router.dart';
import 'package:hero_games_case/presentation/common_widgets/birth_date_picker.dart';
import 'package:hero_games_case/presentation/common_widgets/rounded_cta_button.dart';
import 'package:hero_games_case/presentation/utils/bloc_common.dart';
import 'package:hero_games_case/presentation/utils/custom_colors.dart';
import 'package:hero_games_case/presentation/utils/dimens.dart';
import 'package:hero_games_case/presentation/utils/form_fields.dart';

import '../../app/routing/app_navigator.dart';
import '../../config/di/di.dart';
import 'register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  final navigator = inject<AppNavigator>();
  final data = inject<RegisterBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<RegisterBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = context.read<RegisterBloc>();
            return SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: CustomColors.superNova,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimens.borderRadius)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.horizontalOffset),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(height: Dimens.verticalOffset),
                              Image.asset(
                                "assets/hero_games_logo.png",
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(height: 20),
                              NameFormField(onChanged: (value) {
                                bloc.updateFirstName(value);
                              }),
                              LastNameFormField(
                                onChanged: (value) =>
                                    bloc.updateLastName(value),
                              ),
                              BirthDatePicker(
                                selectDate: (birtDate) {
                                  bloc.updateBirthDay(birtDate);
                                },
                              ),
                              EmailFormField(
                                isValid: (value) => bloc.isEmailValid(value),
                                onChanged: (value) => bloc.updateEmail(value),
                              ),
                              PasswordFormField(
                                isValid: (value) => bloc.isPasswordValid(value),
                                onChanged: (value) =>
                                    bloc.updatePassword(value),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedCtaButton(
                                    horizontalPadding: 10,
                                    width: 100,
                                    height: 40,
                                    title: "Kaydet",
                                    textSize: 10,
                                    icon: "assets/login.png",
                                    isActive: bloc.isFormValid(),
                                    onClicked: () {
                                      if (bloc.isFormValid()) {
                                        bloc.register();
                                        if (state.stateType ==
                                            StateType.success) {
                                          navigator.pushRouteRemoveUntil(
                                              LoginPath());
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
                    Container()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
