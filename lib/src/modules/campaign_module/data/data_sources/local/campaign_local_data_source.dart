abstract class CampaignLocalDataSource {
  Future<void> saveJoinedCampaigns(String data);
  Future<String> getJoinedCampaigns();
  Future<void> clearJoinedCampaigns();
}
