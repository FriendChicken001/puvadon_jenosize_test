// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_remote_repositories.dart';

class CampaignRemoteRepositoriesImpl implements CampaignRemoteRepositories {
  CampaignRemoteRepositoriesImpl({required this.remoteDataSource});

  final CampaignRemoteDataSource remoteDataSource;

  @override
  Future<Either<FailureModel, List<CampaignEntities>>> getCampaigns() async {
    try {
      final result = await remoteDataSource.fetchCampaignData();
      return result.fold(
        (failure) => Left(failure),
        (campaignListModel) => Right(
          campaignListModel.campaigns
              .map(
                (campaign) => CampaignEntities(
                  id: campaign.id,
                  image: campaign.image,
                  title: campaign.title,
                  shortDescription: campaign.shortDescription,
                  status: campaign.status,
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return Left(
        FailureModel(
          message: e.toString(),
          errorCode: ErrorCode.errorRepository,
        ),
      );
    }
  }
}
