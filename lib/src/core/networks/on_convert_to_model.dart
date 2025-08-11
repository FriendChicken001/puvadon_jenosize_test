// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/constants/constants.dart';
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';
import 'package:puvadon_jenosize/src/core/errors/translation/error_i18n_key.dart';

Either<FailureModel, T> onConvertToModel<T>({
  required Either<FailureModel, Response<dynamic>> response,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  try {
    return response.fold(
      (FailureModel l) => Left<FailureModel, T>(l),
      (Response<dynamic> r) => Right<FailureModel, T>(fromJson(r.data)),
    );
  } catch (e) {
    log('Error json to model: $e');

    if (kReleaseMode) {
      // TODO: Log the error in release mode
    }

    return Left<FailureModel, T>(
      FailureModel(
        errorCode: ErrorCode.entitiesConvertError,
        message: ErrorI18nKey.errorErrorModelConvertErrorKey,
      ),
    );
  }
}
