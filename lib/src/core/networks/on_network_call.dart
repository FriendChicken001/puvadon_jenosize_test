// Package imports:
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/errors/models/failure_model.dart';

Future<Either<FailureModel, Response<dynamic>>> onCall<T>({
  required Future<Response<T>> api,
}) async {
  try {
    final Response<dynamic> result = await api;
    return Right<FailureModel, Response<dynamic>>(result);
  } on DioException catch (error) {
    if (error.response?.statusCode == null) {
      return const Left<FailureModel, Response<dynamic>>(UnknownFailure());
    }

    if (error.response!.statusCode! >= 500 ||
        error.response?.statusCode == 404) {
      return Left<FailureModel, Response<dynamic>>(
        FailureModel(
          errorCode: error.response!.statusCode.toString(),
          message: error.response!.statusMessage.toString(),
        ),
      );
    }

    final FailureModel res = FailureModel.fromJson(error.response!.data);

    return Left<FailureModel, Never>(
      FailureModel(message: res.message, errorCode: res.errorCode),
    );
  } catch (e) {
    return const Left<FailureModel, Response<dynamic>>(UnknownFailure());
  }
}
