// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/app.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/routes/campaign_routes.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/local/campaign_local_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/local/campaign_local_data_source_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/repositories_impl/campaign_local_repositories_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/repositories_impl/campaign_remote_repositories_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_local_repositories.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_remote_repositories.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/usecases/campaign_usecase.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/usecases/campaign_usecase_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view/campaign_detail_view.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view/campaign_view.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view_model/campaign_detail_view_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/presentation/view_model/campaign_view_model.dart';

class CampaignModule extends Module {
  @override
  List<GetPage<Map<String, dynamic>>> get routeScreen => [
    GetPage(
      name: CampaignRoutes.root,
      page: () => CampaignView(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: CampaignRoutes.detail,
      page: () => const CampaignDetailPage(),
      binding: CampaignBinding(),
    ),
  ];
}

class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    // data sources
    Get.lazyPut<CampaignRemoteDataSource>(
      () => CampaignRemoteDataSourceImpl(dio: Get.find()),
    );
    Get.lazyPut<CampaignLocalDataSource>(
      () => CampaignLocalDataSourceImpl(secureStorage: Get.find()),
    );
    // repositories
    Get.lazyPut<CampaignRemoteRepositories>(
      () => CampaignRemoteRepositoriesImpl(remoteDataSource: Get.find()),
    );
    Get.lazyPut<CampaignLocalRepositories>(
      () => CampaignLocalRepositoriesImpl(localDataSource: Get.find()),
    );
    // use cases
    Get.lazyPut<CampaignUseCase>(
      () => CampaignUseCaseImpl(
        remoteRepositories: Get.find(),
        localRepositories: Get.find(),
      ),
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
