import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';

class AppLogInterceptor extends Interceptor {
  static bool isLoggingPaused = false;

  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // no stack trace lines
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      excludeBox: const {Level.error: false, Level.info: false},
    ),
    // Only active in debug mode
    filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!isLoggingPaused) {
      final requestPath = '${options.baseUrl}${options.path}';
      _logger.i(
        '${options.method} ==> $requestPath\n'
        'Headers  ==> ${options.headers}\n'
        'Body     ==> ${options.data}\n'
        'Params   ==> ${options.queryParameters}',
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!isLoggingPaused) {
      final requestPath =
          '${response.requestOptions.baseUrl}${response.requestOptions.path}';
      _logger.i(
        '${response.requestOptions.method} ==> $requestPath\n'
        'Status   ==> ${response.statusCode} ${response.statusMessage}\n'
        'Response ==> ${response.data}',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!isLoggingPaused) {
      final requestPath =
          '${err.requestOptions.baseUrl}${err.requestOptions.path}';
      _logger.e(
        '${err.requestOptions.method} ==> $requestPath\n'
        'Status   ==> ${err.response?.statusCode}\n'
        'Message  ==> ${err.message}\n'
        'Response ==> ${err.response?.data}',
        error: err.error,
        stackTrace: err.stackTrace,
      );
    }
    handler.next(err);
  }
}
