// Project imports:
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/local/campaign_local_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_local_repositories.dart';

class CampaignLocalRepositoriesImpl implements CampaignLocalRepositories {
  CampaignLocalRepositoriesImpl({
    required CampaignLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final CampaignLocalDataSource _localDataSource;

  @override
  Future<void> saveJoinedCampaigns(String campaignId) async {
    final joinedCampaigns = await getJoinedCampaigns();
    if (joinedCampaigns.contains(campaignId)) {
      return;
    }
    joinedCampaigns.add(campaignId);
    final data = joinedCampaigns.join(',');
    return _localDataSource.saveJoinedCampaigns(data);
  }

  @override
  Future<List<String>> getJoinedCampaigns() async {
    final joinedCampaigns = await _localDataSource.getJoinedCampaigns();
    return joinedCampaigns.split(',').where((e) => e.isNotEmpty).toList();
  }

  @override
  Future<void> clearJoinedCampaigns() {
    return _localDataSource.clearJoinedCampaigns();
  }
}
