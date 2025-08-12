// Package imports:
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' hide Response;
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_data_source_path.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source_impl.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';
import '../../../../../configs/bindings/init_binding_test_config.dart';
import '../../../mock/campaign_mock.dart';

void main() {
  late Dio mockDio;
  late CampaignRemoteDataSource dataSource;

  setUpAll(() {
    InitBindingTestConfig().dependencies();
    mockDio = Get.find<Dio>();

    dataSource = CampaignRemoteDataSourceImpl(dio: mockDio);
  });

  group('fetchCampaignData', () {
    Map<String, dynamic> response = mockCampaignListModel.toJson();
    String path = CampaignDataSourcePath.getCampaignList;

    test(
      'should return CampaignListModel when the call to API is successful',
      () async {
        // Arrange
        when(mockDio.get(path)).thenAnswer(
          (_) async => Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            data: response,
          ),
        );

        // Act
        final Either<FailureModel, CampaignListModel> result =
            await dataSource.fetchCampaignData();

        // Assert
        expect(result.isRight, true);
        expect(result.right, isA<CampaignListModel>());
      },
    );

    test(
      'should return Failure when the call to API is unsuccessful',
      () async {
        // Arrange
        when(mockDio.get(path)).thenAnswer(
          (_) async =>
              throw DioError(requestOptions: RequestOptions(path: path)),
        );

        // Act
        final Either<FailureModel, CampaignListModel> result =
            await dataSource.fetchCampaignData();

        // Assert
        expect(result.isLeft, true);
        expect(result.left, isA<FailureModel>());
      },
    );
  });
}
