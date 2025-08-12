// Package imports:
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/core/networks/on_convert_to_model.dart';
import 'package:puvadon_jenosize/src/core/networks/on_network_call.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_data_source_path.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';

class CampaignRemoteDataSourceImpl implements CampaignRemoteDataSource {
  CampaignRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<Either<FailureModel, CampaignListModel>> fetchCampaignData() async {
    Future<Response<dynamic>> api = _dio.get(
      CampaignDataSourcePath.getCampaignList,
    );
    final result = await onCall(api: api);
    return onConvertToModel<CampaignListModel>(
      response: result,
      fromJson: CampaignListModel.fromJson,
    );
  }
}
