// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/common/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/navigations/navigation_core.dart';
import 'package:puvadon_jenosize/src/core/networks/dio_core.dart';
import 'package:puvadon_jenosize/src/core/secure_storage_core.dart';
import 'package:puvadon_jenosize/src/core/translation_core.dart';
import 'package:puvadon_jenosize/src/modules/app.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/campaign_module.dart';
import 'package:puvadon_jenosize/src/modules/profile_module/profile_module.dart';

class AppModule extends Module {
  @override
  List<GetPage<Map<String, dynamic>>> get routeScreen =>
      <GetPage<Map<String, dynamic>>>[
        ...CampaignModule().routeScreen,
        ...ProfileModule().routeScreen,
      ];
}

class AppModuleBinding extends Bindings {
  @override
  void dependencies() {
    // core dependencies
    Get.put<SecureStorage>(SecureStorageImpl());
    Get.put<Navigation>(NavigationImpl());
    Get.put<Translation>(TranslationImpl());
    // dio dependencies
    Get.put<Dio>(
      Dio()
        ..options.baseUrl = FlavorConfig.instance.variables[flavorBaseUrl]
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.sendTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30),
    );
    Get.find<Dio>().interceptors.add(DioInterceptor());
  }
}
