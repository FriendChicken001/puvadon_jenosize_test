// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignListModel _$CampaignListModelFromJson(Map<String, dynamic> json) =>
    CampaignListModel(
      campaigns:
          (json['data'] as List<dynamic>)
              .map((e) => CampaignModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CampaignListModelToJson(CampaignListModel instance) =>
    <String, dynamic>{
      'data': instance.campaigns.map((e) => e.toJson()).toList(),
    };

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      id: json['id'] as String,
      image: json['image'] as String?,
      title: json['title'] as String,
      shortDescription: json['short_description'] as String,
      status: $enumDecode(_$CampaignStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.image case final value?) 'image': value,
      'title': instance.title,
      'short_description': instance.shortDescription,
      'status': _$CampaignStatusEnumMap[instance.status]!,
    };

const _$CampaignStatusEnumMap = {
  CampaignStatus.active: 'active',
  CampaignStatus.inactive: 'inactive',
  CampaignStatus.completed: 'completed',
};
