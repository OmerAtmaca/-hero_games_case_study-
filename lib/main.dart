import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hero_games_case/app/app.dart';
import 'package:hero_games_case/config/app_config.dart';
import 'package:hero_games_case/config/di/di.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDI(DevConfig());
  runApp(const App());
}
