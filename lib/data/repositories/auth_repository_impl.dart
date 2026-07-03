import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/core/resources/params/auth/sign_out_params.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/data/data_sources/auth_remote_datasource.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(authRemoteDatasourceProvider)),
);

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _datasource;
  AuthRepositoryImpl(this._datasource);

  @override
  Future<AuthResponseEntity> signUp({required SignUpParams params}) async {
    try {
      return await _datasource.signUp(params);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<AuthResponseEntity> signIn({required SignInParams params}) async {
    try {
      return await _datasource.signIn(params);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<AuthResponseEntity> signOut({required SignOutParams params}) async {
    try {
      return await _datasource.signOut(params);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<AuthResponseEntity> forgotPassword({
    required SignInParams params,
  }) async {
    try {
      return await _datasource.forgotPassword(params);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }
}
