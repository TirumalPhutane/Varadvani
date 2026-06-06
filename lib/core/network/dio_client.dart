import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/error/failures.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

class DioClient {
  late final Dio _dio;
  String? _authToken; // ✅ stored after login

  DioClient() {
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

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onError: (DioException e, handler) {
          handler.next(e);
        },
      ),
    );
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
    bool requiresAuth = false, // pass true for protected APIs
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
    bool requiresAuth = false, // pass true for protected APIs
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
}
