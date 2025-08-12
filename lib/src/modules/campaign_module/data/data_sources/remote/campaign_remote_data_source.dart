// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';

abstract class CampaignRemoteDataSource {
  Future<Either<FailureModel, CampaignListModel>> fetchCampaignData();
}
