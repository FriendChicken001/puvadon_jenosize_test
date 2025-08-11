// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/repositories/home_repositories.dart';
import 'package:puvadon_jenosize/src/modules/home_module/domain/usecases/home_usecase.dart';

class HomeUseCaseImpl implements HomeUseCase {
  HomeUseCaseImpl({required this.repositories});

  final HomeRepositories repositories;

  @override
  Future<Either<FailureModel, List<CampaignEntities>>> getCampaigns() {
    try {
      return repositories.getCampaigns();
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
}
