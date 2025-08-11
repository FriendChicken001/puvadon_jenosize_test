// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/data_sources/remote/home_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  HomeRepositoriesImpl({required this.remoteDataSource});

  final HomeRemoteDataSource remoteDataSource;

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
