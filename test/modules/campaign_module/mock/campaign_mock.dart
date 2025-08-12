// Package imports:
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/remote/campaign_remote_data_source.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/entities/campaing_entities.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/domain/repositories/campaign_remote_repositories.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  //data source
  MockSpec<CampaignRemoteDataSource>(),
  //repository
  MockSpec<CampaignRemoteRepositories>(),
])
// mock data
const String expectString = 'mock';

final mockCampaignListModel = CampaignListModel(
  campaigns: <CampaignModel>[mockCampaignModel],
);

final mockCampaignModel = CampaignModel(
  id: '1',
  image: 'https://example.com/image1.png',
  title: 'Campaign 1',
  shortDescription: 'Short description for campaign 1',
  status: CampaignStatus.active,
);

final mockCampaignEntities = CampaignEntities(
  id: '1',
  image: 'https://example.com/image1.png',
  title: 'Campaign 1',
  shortDescription: 'Short description for campaign 1',
  status: CampaignStatus.active,
);

const FailureModel mockFailureModel = FailureModel(
  message: expectString,
  errorCode: expectString,
);
