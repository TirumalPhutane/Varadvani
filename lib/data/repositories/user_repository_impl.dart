import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/resources/params/profile/update_profile_params.dart';
import 'package:varadvani/data/data_sources/user_remote_datasource.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(userRemoteDatasourceProvider)),
);

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _datasource;
  UserRepositoryImpl(this._datasource);

  @override
  Future<AuthResponseEntity> getProfile({required String id}) async {
    try {
      return await _datasource.getProfile(id);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<AuthResponseEntity> updateProfile({
    required UpdateProfileParams params,
  }) async {
    try {
      return await _datasource.updateProfile(params);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<AuthResponseEntity> deleteProfile({required String id}) async {
    try {
      return await _datasource.deleteProfile(id);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }
}
