// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/home_module/data/models/campaign_list_model.dart';

abstract class HomeRemoteDataSource {
  Future<Either<FailureModel, CampaignListModel>> fetchCampaignData();
}
