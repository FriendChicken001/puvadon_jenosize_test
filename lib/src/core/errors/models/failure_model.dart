// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'failure_model.g.dart';

@JsonSerializable()
class FailureModel extends Equatable {
  factory FailureModel.fromJson(Map<String, dynamic> json) =>
      _$FailureModelFromJson(json);

  const FailureModel({required this.errorCode, required this.message});

  @JsonKey(name: 'error_code')
  final String errorCode;
  @JsonKey(name: 'message')
  final String message;

  Map<String, dynamic> toJson() => _$FailureModelToJson(this);

  @override
  List<Object> get props => <Object>[errorCode, message];
}

class UnknownFailure extends FailureModel {
  const UnknownFailure({
    super.message = 'Unknown error',
    super.errorCode = '400',
  });
}
