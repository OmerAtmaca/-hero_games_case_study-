import 'package:flutter/material.dart';
import 'package:hero_games_case/presentation/utils/custom_colors.dart';


ThemeData defaultTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: CustomColors.astral,
      fontFamily: 'Inter',
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: CustomColors.mirage),
    );
