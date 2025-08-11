// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/entities/campaing_entities.dart';

abstract class HomeRepositories {
  Future<Either<FailureModel, List<CampaignEntities>>> getCampaigns();
}
