// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/enums/global_enums.dart';
import 'package:puvadon_jenosize/src/common/themes/color_theme.dart';
import 'package:puvadon_jenosize/src/common/translation/translation_config.dart';
import 'package:puvadon_jenosize/src/core/navigations/route_tracking_observer.dart';
import 'package:puvadon_jenosize/src/modules/app_module.dart';
import 'package:puvadon_jenosize/src/modules/home_module/config/home_routes.dart';

abstract class Module {
  List<GetPage<Map<String, dynamic>>> get routeScreen;
}

class App extends StatelessWidget {
  const App({super.key, required this.languageCode});

  final LanguageCode languageCode;

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }

  ThemeData _buildTheme() {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorsTheme.instance.primary,
      ),
    );
  }

  Locale _getLocale() {
    return languageCode == LanguageCode.th
        ? const Locale('th', 'TH')
        : const Locale('en', 'EN');
  }

  Widget _buildMaterialApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeRoutes.root,
      initialBinding: AppModuleBinding(),
      getPages: AppModule().routeScreen,
      translations: TranslationsConfig(),
      theme: _buildTheme(),
      locale: _getLocale(),
      navigatorObservers: [
        RouteTrackingObserver.instance,
        ChuckerFlutter.navigatorObserver,
      ],
    );
  }
}
