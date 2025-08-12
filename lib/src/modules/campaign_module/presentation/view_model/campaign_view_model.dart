// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/navigations/navigation_core.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/campaign_routes.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/config/constants/campaign_constants.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/usecases/campaign_usecase.dart';

class CampaignViewModel extends GetxController {
  CampaignViewModel({
    required CampaignUseCase campaignUseCase,
    required Navigation navigation,
  }) : _campaignUseCase = campaignUseCase,
       _navigation = navigation;

  final CampaignUseCase _campaignUseCase;
  final Navigation _navigation;
  final RxList<CampaignEntities> _campaigns = <CampaignEntities>[].obs;
  List<CampaignEntities> get campaigns => _campaigns;

  @override
  void onInit() {
    super.onInit();
    fetchCampaigns();
  }

  Future<void> fetchCampaigns() async {
    final result = await _campaignUseCase.getCampaigns();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (campaigns) => _campaigns.assignAll(campaigns),
    );
  }

  Future<bool> hasJoinedCampaign(String campaignId) async {
    return await _campaignUseCase.isJoinedCampaign(campaignId);
  }

  void navigateToCampaignDetail(CampaignEntities campaign) {
    _navigation.push(
      CampaignRoutes.detail,
      arguments: {CampaignConstants.campaignData: campaign},
    );
  }
}
