import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/data/repositories/auth_repository_impl.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/auth_repository.dart';

final signUpUsecaseProvider = Provider<SignUpUsecase>(
  (ref) => SignUpUsecase(ref.read(authRepositoryProvider)),
);

class SignUpUsecase {
  final AuthRepository _repository;
  SignUpUsecase(this._repository);

  Future<AuthResponseEntity> call(SignUpParams params) {
    return _repository.signUp(params: params);
  }
}
