// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Dio error: ${err.message}', name: 'DioInterceptor');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      'Dio request: ${options.method} ${options.path}',
      name: 'DioInterceptor',
    );
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log(
      'Dio response: ${response.statusCode} ${response.requestOptions.uri}',
      name: 'DioInterceptor',
    );
    return handler.next(response);
  }
}
