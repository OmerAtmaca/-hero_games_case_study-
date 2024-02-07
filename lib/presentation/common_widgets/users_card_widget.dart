import 'package:flutter/material.dart';
import 'package:hero_games_case/data/models/users_model.dart';
import 'package:hero_games_case/presentation/common_widgets/custom_card_shape_painter.dart';

import '../utils/custom_colors.dart';

class CardUsersWidget extends StatelessWidget {
  const CardUsersWidget(
      {super.key, required this.data});
  final UsersModel? data;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                  colors: [CustomColors.astral, CustomColors.hawkesBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 6))
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          data?.firstName ?? "",
                          style: const TextStyle(
                              fontSize: 20,
                              color: CustomColors.mirage,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data?.lastName ?? "",
                          style: const TextStyle(
                              fontSize: 20,
                              color: CustomColors.mirage,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data?.birthday != null
                              ? data!.birthday
                                  .toString()
                                  .substring(0, 10)
                                  .split('-')
                                  .reversed
                                  .join("-")
                              : "Date not available",
                          style: const TextStyle(
                              fontSize: 18, color: CustomColors.mirage),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Positioned(
        right: 0,
        bottom: 0,
        top: 0,
        child: CustomPaint(
          size: const Size(100, 150),
          painter: CustomCardShapePainter(
              24, CustomColors.hawkesBlue, CustomColors.astral),
        ),
      )
    ]);
  }
}
