// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_local_repositories.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_remote_repositories.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/usecases/campaign_usecase.dart';

class CampaignUseCaseImpl implements CampaignUseCase {
  CampaignUseCaseImpl({
    required this.remoteRepositories,
    required this.localRepositories,
  });

  final CampaignRemoteRepositories remoteRepositories;
  final CampaignLocalRepositories localRepositories;

  @override
  Future<Either<FailureModel, List<CampaignEntities>>> getCampaigns() {
    try {
      return remoteRepositories.getCampaigns();
    } catch (e) {
      return Future.value(
        Left(
          FailureModel(
            message: e.toString(),
            errorCode: ErrorCode.errorUseCase,
          ),
        ),
      );
    }
  }

  @override
  Future<void> saveJoinedCampaigns(String campaignId) {
    try {
      return localRepositories.saveJoinedCampaigns(campaignId);
    } catch (e) {
      return Future.error(
        FailureModel(message: e.toString(), errorCode: ErrorCode.errorUseCase),
      );
    }
  }

  @override
  Future<List<String>> getJoinedCampaigns() {
    try {
      return localRepositories.getJoinedCampaigns();
    } catch (e) {
      return Future.error(
        FailureModel(message: e.toString(), errorCode: ErrorCode.errorUseCase),
      );
    }
  }

  @override
  Future<void> clearJoinedCampaigns() {
    try {
      return localRepositories.clearJoinedCampaigns();
    } catch (e) {
      return Future.error(
        FailureModel(message: e.toString(), errorCode: ErrorCode.errorUseCase),
      );
    }
  }

  @override
  Future<bool> isJoinedCampaign(String campaignId) async {
    try {
      final getJoinedCampaigns = await localRepositories.getJoinedCampaigns();
      return getJoinedCampaigns.contains(campaignId);
    } catch (e) {
      return Future.error(
        FailureModel(message: e.toString(), errorCode: ErrorCode.errorUseCase),
      );
    }
  }
}
