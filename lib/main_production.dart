// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/constants/constants.dart';
import 'package:puvadon_jenosize/src/common/enums/global_enums.dart';
import 'package:puvadon_jenosize/src/core/translation_core.dart';
import 'package:puvadon_jenosize/src/modules/app.dart';
import 'package:puvadon_jenosize/src/modules/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment
  await FlutterConfig.loadEnvVariables();

  // Set flavor
  FlavorConfig(
    name: production,
    variables: <String, dynamic>{flavorBaseUrl: FlutterConfig.get(baseUrlEnv)},
  );

  // Set the dependencies
  AppModuleBinding().dependencies();

  // Get locale
  final Translation translation = Get.find<Translation>();
  final LanguageCode currentLanguage = await translation.currentLanguage();

  /// Lock screen orientation portrait
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App(languageCode: currentLanguage));
}
