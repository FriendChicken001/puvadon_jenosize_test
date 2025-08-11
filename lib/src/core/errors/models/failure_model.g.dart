// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureModel _$FailureModelFromJson(Map<String, dynamic> json) => FailureModel(
  errorCode: json['error_code'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$FailureModelToJson(FailureModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
    };
