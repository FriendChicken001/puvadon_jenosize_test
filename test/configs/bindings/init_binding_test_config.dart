// Package imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/app_module.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/campaign_module.dart';
import '../../modules/app_module_test.dart';
import '../../modules/campaign_module/campaign_module_test.dart';
import '../mock/mock_data.dart';

class InitBindingTestConfig {
  final AppModuleBinding appModuleBinding = MockAppModuleBinding();
  final CampaignModuleBinding campaignModuleBinding =
      MockCampaignModuleBinding();

  void dependencies() async {
    FlutterConfig.loadValueForTesting(mockEnv);

    appModuleBinding.dependencies();
    campaignModuleBinding.dependencies();

    Get.testMode = true;
  }
}
