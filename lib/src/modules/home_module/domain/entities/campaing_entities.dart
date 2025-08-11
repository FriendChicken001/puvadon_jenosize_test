// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:puvadon_jenosize/src/modules/home_module/data/models/campaign_list_model.dart';

class CampaignEntities extends Equatable {

  const CampaignEntities({
    required this.id,
    required this.image,
    required this.title,
    required this.shortDescription,
    required this.status,
  });
  final String id;
  final String? image;
  final String title;
  final String shortDescription;
  final CampaignStatus status;

  @override
  List<Object?> get props => [id, image, title, shortDescription, status];
}
