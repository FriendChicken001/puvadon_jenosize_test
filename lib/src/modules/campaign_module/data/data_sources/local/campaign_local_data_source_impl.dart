// Project imports:
import 'package:puvadon_jenosize/src/common/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/secure_storage_core.dart';
import 'package:puvadon_jenosize/src/modules/campaign_module/data/data_sources/local/campaign_local_data_source.dart';

class CampaignLocalDataSourceImpl implements CampaignLocalDataSource {
  CampaignLocalDataSourceImpl({required SecureStorage secureStorage})
    : _secureStorage = secureStorage;

  final SecureStorage _secureStorage;

  @override
  Future<void> saveJoinedCampaigns(String data) async {
    await _secureStorage.write(key: secureJoinCampaignStorage, value: data);
  }

  @override
  Future<String> getJoinedCampaigns() async {
    final result = await _secureStorage.read(key: secureJoinCampaignStorage);
    return result ?? '';
  }

  @override
  Future<void> clearJoinedCampaigns() async {
    await _secureStorage.delete(key: secureJoinCampaignStorage);
  }
}
