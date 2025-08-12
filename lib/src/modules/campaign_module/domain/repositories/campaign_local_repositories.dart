abstract class CampaignLocalRepositories {
  Future<void> saveJoinedCampaigns(String data);
  Future<List<String>> getJoinedCampaigns();
  Future<void> clearJoinedCampaigns();
}
