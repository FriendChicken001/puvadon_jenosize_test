// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/navigations/navigation_core.dart';
import 'package:puvadon_jenosize/src/core/secure_storage_core.dart';
import 'package:puvadon_jenosize/src/core/translation_core.dart';
import 'package:puvadon_jenosize/src/modules/app_module.dart';
import '../configs/bindings/init_binding_test_config.dart';
import '../configs/mock/mock_data.mocks.dart';

class MockAppModuleBinding extends AppModuleBinding {
  @override
  void dependencies() {
    Get.put<SecureStorage>(MockSecureStorageImpl());
    Get.put<Navigation>(MockNavigation());
    Get.put<Translation>(TranslationImpl());
    Get.put<Dio>(MockDio());
  }
}

void main() {
  final AppModule appModule = AppModule();

  setUp(() {
    InitBindingTestConfig().dependencies();
  });

  test('AppModule routeScreen returns correct routes', () {
    final List<GetPage<Map<String, dynamic>>> routes = appModule.routeScreen;

    expect(routes.length, 4);
  });

  test('AppModuleBinding dependencies returns correct bindings', () {
    expect(Get.find<Dio>(), isA<Dio>());
    expect(Get.find<Navigation>(), isA<Navigation>());
    expect(Get.find<SecureStorage>(), isA<SecureStorage>());
    expect(Get.find<Translation>(), isA<Translation>());
  });
}
