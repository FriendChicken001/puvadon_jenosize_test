// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/campaign_module/campaign_module.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/routes/campaign_routes.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_remote_repositories.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view/campaign_detail_view.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view/campaign_view.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view_model/campaign_detail_view_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view_model/campaign_view_model.dart';
import '../../configs/bindings/init_binding_test_config.dart';
import 'mock/campaign_mock.mocks.dart';

class MockCampaignModuleBinding extends CampaignModuleBinding {
  @override
  void dependencies() {
    // Data Source
    Get.lazyPut<CampaignRemoteDataSource>(() => MockCampaignRemoteDataSource());

    // Repository
    Get.lazyPut<CampaignRemoteRepositories>(
      () => MockCampaignRemoteRepositories(),
    );

    // view model
    Get.lazyPut<CampaignViewModel>(
      () => CampaignViewModel(
        campaignUseCase: Get.find(),
        navigation: Get.find(),
      ),
    );
    Get.lazyPut<CampaignDetailViewModel>(
      () => CampaignDetailViewModel(campaignUseCase: Get.find()),
    );
  }
}

void main() {
  final CampaignModule campaignModule = CampaignModule();

  setUp(() {
    Get.testMode = true;
    WidgetsFlutterBinding.ensureInitialized();
    InitBindingTestConfig().dependencies();
  });

  tearDown(() {
    Get.reset();
  });

  test('CampaignModule routeScreen returns correct routes', () {
    final List<GetPage<Map<String, dynamic>>> routes =
        campaignModule.routeScreen;

    expect(routes.length, 2);

    expect(routes[0].name, CampaignRoutes.root);
    expect(routes[0].page(), isA<CampaignView>());
    expect(routes[0].binding, isA<CampaignModuleBinding>());

    expect(routes[1].name, CampaignRoutes.detail);
    expect(routes[1].page(), isA<CampaignDetailView>());
    expect(routes[1].binding, isA<CampaignModuleBinding>());
  });
}
