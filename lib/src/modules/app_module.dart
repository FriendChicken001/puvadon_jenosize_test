// Package imports:
import 'package:chucker_flutter/chucker_flutter.dart';
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
import 'package:puvadon_jenosize/src/modules/home_module/home_module.dart';

class AppModule extends Module {
  @override
  List<GetPage<Map<String, dynamic>>> get routeScreen =>
      <GetPage<Map<String, dynamic>>>[...HomeModule().routeScreen];
}

class AppModuleBinding extends Bindings {
  final String? _env = FlavorConfig.instance.name;

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
    Get.find<Dio>().interceptors.clear();
    Get.find<Dio>().interceptors.add(DioInterceptor());
    if (_env == developer) {
      Get.find<Dio>().interceptors.add(ChuckerDioInterceptor());
    }
  }
}
