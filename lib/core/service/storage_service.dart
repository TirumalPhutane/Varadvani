import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:varadvani/core/constants/app_constants.dart';

final storageServiceProvider = Provider<StorageService>(
  (ref) => StorageService(),
);

class StorageService {
  Box get authBox => Hive.box(AppConstants.authBox);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String userId,
  }) async {
    await authBox.put(AppConstants.accessTokenKey, accessToken);
    await authBox.put(AppConstants.refreshTokenKey, refreshToken);
    await authBox.put(AppConstants.userId, userId);
  }

  String? getAccessToken() => authBox.get(AppConstants.accessTokenKey);

  String? getRefreshToken() => authBox.get(AppConstants.refreshTokenKey);

  String? getUserId() => authBox.get(AppConstants.userId);

  Future<void> clearTokens() async => await authBox.clear();
}
