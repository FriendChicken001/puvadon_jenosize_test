// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/home_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/repositories/home_repositories.dart';

class HomeViewModel extends GetxController {
  HomeViewModel({required HomeRepositories homeRepositories})
    : _homeRepositories = homeRepositories;

  final HomeRepositories _homeRepositories;
  final RxList<CampaignEntities> _campaigns = <CampaignEntities>[].obs;
  List<CampaignEntities> get campaigns => _campaigns;

  @override
  void onInit() {
    super.onInit();
    fetchCampaigns();
  }

  Future<void> fetchCampaigns() async {
    final result = await _homeRepositories.getCampaigns();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (campaigns) => _campaigns.assignAll(campaigns),
    );
  }
}
