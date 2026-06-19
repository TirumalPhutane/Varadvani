import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/network/log_interceptor.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/data/models/auth/auth_response_model.dart';
import 'package:varadvani/main.dart';

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(ref.read(storageServiceProvider)),
);

class DioClient {
  late final Dio _dio;
  String? _authToken;

  final StorageService _storageService;
  Future<AuthResponseModel>? _refreshFuture;

  DioClient(this._storageService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'x-client-type': 'mobile',
        },
      ),
    );

    _dio.interceptors.addAll([
      if (kDebugMode) AppLogInterceptor(),
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onError: (DioException e, handler) async {
          final isUnauthorized = e.response?.statusCode == 401;
          final alreadyRetried = e.requestOptions.extra['retried'] == true;

          if (!isUnauthorized || alreadyRetried) {
            return handler.next(e);
          }

          try {
            final refreshResponse = await _refreshToken();
            final newAccessToken = refreshResponse.data.accessToken;
            var newRefreshToken = refreshResponse.data.refreshToken;

            if (newAccessToken.isEmpty) {
              return handler.next(e);
            }

            //newRefreshToken ??= _storageService.getRefreshToken();

            // Persist new tokens — adjust method names to your
            // StorageService API.
            await _storageService.updateAuthTokens(
              accessToken: newAccessToken,
              refreshToken: newRefreshToken.isNotEmpty
                  ? newRefreshToken
                  : _storageService.getRefreshToken() ?? '',
            );

            // Keep in-memory token in sync for future requests.
            setAuthToken(newAccessToken);

            // Retry the original request that failed, with the new token.
            final retryOptions = e.requestOptions;
            retryOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            retryOptions.extra['retried'] = true;

            final retryResponse = await _dio.fetch(retryOptions);
            return handler.resolve(retryResponse);
          } catch (err, st) {
            debugPrint('Token refresh/retry failed: $err\n$st');
            return handler.next(e);
          }
        },
      ),
    ]);
  }

  Future<AuthResponseModel> _refreshToken() {
    return _refreshFuture ??= _performRefresh().whenComplete(() {
      _refreshFuture = null;
    });
  }

  Future<AuthResponseModel> _performRefresh() async {
    final refreshToken = _storageService.getRefreshToken() ?? '';

    try {
      final Response<dynamic> response = await _dio.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final authResponse = AuthResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      if (!authResponse.success) {
        clearAuthToken();
        _storageService.clearTokens();
        _navigateToSignIn();
        throw Exception('Session expired');
      }
      return authResponse;
    } on DioException catch (e) {
      clearAuthToken();
      _storageService.clearTokens();
      _navigateToSignIn();
      throw Exception(e.message);
    }
  }

  void _navigateToSignIn() {
    final context = navigatorKey.currentContext;
    if (context != null && context.mounted) {
      Navigator.pushNamed(context, AppRoutes.signInScreen);
    }
  }

  /// Call this after login to store token globally
  void setAuthToken(String token) {
    _authToken = token;
  }

  /// Call this on logout
  void clearAuthToken() {
    _authToken = null;
  }

  /// Builds headers — attaches bearer token only when [requiresAuth] is true
  Map<String, dynamic> _buildHeaders({bool requiresAuth = false}) {
    return {
      if (requiresAuth && _authToken != null)
        'Authorization': 'Bearer $_authToken',
    };
  }

  Map<String, dynamic> _parseError(DioException e) {
    final data = e.response?.data;
    final msg = data?['message'] ?? e.message ?? 'Something went wrong.';
    final errors =
        (data?['errors'] as List?)?.map((e) => e.toString()).toList() ?? [];
    return {'message': msg, 'errors': errors};
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: Options(headers: _buildHeaders(requiresAuth: requiresAuth)),
      );
    } on DioException catch (e) {
      final err = _parseError(e);
      throw ServerException(
        message: err['message'],
        statusCode: e.response?.statusCode,
        errors: err['errors'],
      );
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    bool requiresAuth = false,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: _buildHeaders(requiresAuth: requiresAuth)),
      );
    } on DioException catch (e) {
      final err = _parseError(e);
      throw ServerException(
        message: err['message'],
        statusCode: e.response?.statusCode,
        errors: err['errors'],
      );
    }
  }

  Future<Response> patch(
    String path, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        options: Options(headers: _buildHeaders(requiresAuth: requiresAuth)),
      );
    } on DioException catch (e) {
      final err = _parseError(e);
      throw ServerException(
        message: err['message'],
        statusCode: e.response?.statusCode,
        errors: err['errors'],
      );
    }
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        options: Options(headers: _buildHeaders(requiresAuth: requiresAuth)),
      );
    } on DioException catch (e) {
      final err = _parseError(e);
      throw ServerException(
        message: err['message'],
        statusCode: e.response?.statusCode,
        errors: err['errors'],
      );
    }
  }
}
