import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/resources/params/auth/sign_out_params.dart';
import 'package:varadvani/data/repositories/auth_repository_impl.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/auth_repository.dart';

final signOutUsecaseProvider = Provider<SignOutUsecase>(
  (ref) => SignOutUsecase(ref.read(authRepositoryProvider)),
);

class SignOutUsecase {
  final AuthRepository _repository;
  SignOutUsecase(this._repository);

  Future<AuthResponseEntity> call(SignOutParams params) {
    return _repository.signOut(params: params);
  }
}
