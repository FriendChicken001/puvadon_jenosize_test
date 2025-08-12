// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/campaign_module/data/models/campaign_list_model.dart';
import '../../mock/campaign_mock.dart';

void main() {
  group('CampaignListModel', () {
    test('should create an instance with required parameters', () {
      final CampaignListModel model = mockCampaignListModel;

      expect(model.campaigns, isNotEmpty);
    });

    test('should create an instance from JSON', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'data': [
          {
            'id': 'f7a847dc-95b8-4c5f-b899-44f634bd14e5',
            'image': 'https://example.com/image.jpg',
            'title': 'Summer Sale 2025',
            'short_description': 'Get ready for the summer sale!',
            'status': 'active',
          },
        ],
      };

      final CampaignListModel model = CampaignListModel.fromJson(json);

      expect(model.campaigns, isNotEmpty);
      expect(model.campaigns.first.id, 'f7a847dc-95b8-4c5f-b899-44f634bd14e5');
      expect(model.campaigns.first.title, 'Summer Sale 2025');
      expect(model.campaigns.first.status, CampaignStatus.active);
    });
  });
}
