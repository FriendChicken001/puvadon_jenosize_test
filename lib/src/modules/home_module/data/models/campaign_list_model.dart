// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campaign_list_model.g.dart';

enum CampaignStatus { active, inactive, completed }

@JsonSerializable()
class CampaignListModel extends Equatable {
  const CampaignListModel({required this.campaigns});

  factory CampaignListModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignListModelFromJson(json);

  @JsonKey(name: 'data')
  final List<CampaignModel> campaigns;

  Map<String, dynamic> toJson() => _$CampaignListModelToJson(this);

  @override
  List<Object?> get props => [campaigns];
}

@JsonSerializable()
class CampaignModel extends Equatable {
  const CampaignModel({
    required this.id,
    this.image,
    required this.title,
    required this.shortDescription,
    required this.status,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @JsonKey(name: 'status')
  final CampaignStatus status;

  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);

  @override
  List<Object?> get props => [id, image, title, shortDescription, status];
}
