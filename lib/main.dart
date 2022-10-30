import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_app_settings/hyper_app_settings.dart';
import 'app/app.dart';
import 'config/build_config.dart';
import 'config/env_config.dart';
import 'config/environment.dart';
import 'config/firebase_options.dart';

void main() async {
  // Allow initialization before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();

  await AppSettings.init();

  // Environment config.
  //
  // Set base url.
  EnvConfig envConfig = EnvConfig(
    baseUrl: AppSettings.get('baseUrl'),
  );

  // Build config.
  //
  // Select environment type.
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: envConfig,
  );

  // Prevent screen rotation.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Firebase.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}
