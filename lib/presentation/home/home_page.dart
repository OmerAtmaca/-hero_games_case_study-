import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_games_case/presentation/common_widgets/custom_text_field.dart';
import 'package:hero_games_case/presentation/common_widgets/rounded_cta_button.dart';
import 'package:hero_games_case/presentation/common_widgets/users_card_widget.dart';
import 'package:hero_games_case/presentation/home/home_bloc.dart';
import 'package:hero_games_case/presentation/utils/custom_colors.dart';
import 'package:hero_games_case/presentation/utils/dimens.dart';

import '../../app/routing/app_navigator.dart';
import '../../app/routing/app_router.dart';
import '../../config/di/di.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final navigator = inject<AppNavigator>();
  final data = inject<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => data,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          actionsIconTheme: const IconThemeData(color: CustomColors.astral),
          actions: [
            IconButton(
                onPressed: () {
                  data.logout();
                  navigator.pushRoute(LoginPath());
                },
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final bloc = context.read<HomeBloc>();
            return FutureBuilder(
                future: data.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final userData = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          userData != null
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                    child: CardUsersWidget(data: userData),
                                  ))
                              : const SizedBox(),
                          const SizedBox(height: 100),
                          CustomTextField(
                            hint: "Eklemek istediğiniz hobiniz ",
                            validator: (value) {
                              return null;
                            },
                            isValid: (valid) => bloc.isValid(valid),
                            onChanged: (value) {
                              bloc.updateHobby(value);
                            },
                            label: "Hobilerinizi ekleyin",
                          ),
                          const SizedBox(height: Dimens.verticalOffset),
                          RoundedCtaButton(
                            horizontalPadding: 10,
                            width: 100,
                            height: 40,
                            title: "Kaydet",
                            textSize: 10,
                            isActive: bloc.isFormValid(),
                            onClicked: () {
                              if (bloc.isFormValid()) {
                                if (state.hobby != "") {
                                  bloc.addData(data: state.hobby);
                                }
                              } else {
                                navigator.showInfoScaffold(context, () {},
                                    "Lütfen alanları kontrol ediniz!");
                              }
                            },
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: userData!.hobbies?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        gradient: const LinearGradient(
                                            colors: [
                                              CustomColors.astral,
                                              CustomColors.hawkesBlue
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 10,
                                              offset: const Offset(0, 6))
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Center(
                                          child:
                                              Text(userData.hobbies![index]))),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                });
          },
        ),
      ),
    );
  }
}
