// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/campaign_module/config/constants/campaign_constants.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/usecases/campaign_usecase.dart';

class CampaignDetailViewModel extends GetxController {
  CampaignDetailViewModel({required this.campaignUseCase});

  final CampaignUseCase campaignUseCase;

  // Reactive state
  final isJoined = false.obs;
  final isLoading = false.obs;
  final campaign = Rxn<CampaignEntities>();

  String? get campaignId => campaign.value?.id;

  @override
  void onInit() {
    super.onInit();

    final arg =
        Get.arguments[CampaignConstants.campaignData] as CampaignEntities?;
    if (arg != null) {
      campaign.value = arg;
      _loadJoinedState();
    } else {
      Get.snackbar('Error', 'Campaign data not found');
    }
  }

  Future<void> _loadJoinedState() async {
    final id = campaignId;
    if (id == null) return;
    isLoading.value = true;
    try {
      isJoined.value = await campaignUseCase.isJoinedCampaign(id);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveJoinedCampaign() async {
    final id = campaignId;
    if (id == null) return;
    try {
      await campaignUseCase.saveJoinedCampaigns(id);
      isJoined.value = true;
      Get.snackbar('Success', 'Campaign joined successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
