// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';

abstract class CampaignUseCase {
  Future<Either<FailureModel, List<CampaignEntities>>> getCampaigns();
  Future<void> saveJoinedCampaigns(String campaignId);
  Future<List<String>> getJoinedCampaigns();
  Future<void> clearJoinedCampaigns();
  Future<bool> isJoinedCampaign(String campaignId);
}
