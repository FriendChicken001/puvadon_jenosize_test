// Package imports:
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as g;
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/repositories_impl/campaign_remote_repositories_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';
import '../../../../configs/bindings/init_binding_test_config.dart';
import '../../mock/campaign_mock.dart';

void main() {
  late CampaignRemoteRepositoriesImpl repository;
  late CampaignRemoteDataSource mockRemoteDataSource;

  setUp(() {
    InitBindingTestConfig().dependencies();

    mockRemoteDataSource = g.Get.find<CampaignRemoteDataSource>();
    repository = CampaignRemoteRepositoriesImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('fetchCampaignList', () {
    test(
      'fetchCampaignList should return CampaignListModel on success',
      () async {
        //dummy data
        provideDummy<Either<FailureModel, CampaignListModel>>(
          Right<FailureModel, CampaignListModel>(mockCampaignListModel),
        );

        // Arrange
        when(mockRemoteDataSource.fetchCampaignData()).thenAnswer(
          (_) async =>
              Right<FailureModel, CampaignListModel>(mockCampaignListModel),
        );

        // Act
        final Either<FailureModel, List<CampaignEntities>> result =
            await repository.getCampaigns();

        // Assert
        expect(result.isRight, true);
        expect(result.right, isA<List<CampaignEntities>>());
      },
    );

    test('fetchCampaignList should return FailureModel on failure', () async {
      //dummy data
      provideDummy<Either<FailureModel, CampaignListModel>>(
        Left<FailureModel, CampaignListModel>(mockFailureModel),
      );

      // Arrange
      when(mockRemoteDataSource.fetchCampaignData()).thenAnswer(
        (_) async =>
            const Left<FailureModel, CampaignListModel>(mockFailureModel),
      );

      // Act
      final Either<FailureModel, List<CampaignEntities>> result =
          await repository.getCampaigns();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, mockFailureModel);
    });
  });
}
