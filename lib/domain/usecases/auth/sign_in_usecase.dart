import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/data/repositories/auth_repository_impl.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/auth_repository.dart';

final signInUsecaseProvider = Provider<SignInUsecase>(
  (ref) => SignInUsecase(ref.read(authRepositoryProvider)),
);

class SignInUsecase {
  final AuthRepository _repository;
  SignInUsecase(this._repository);

  Future<AuthResponseEntity> call(SignInParams params) {
    return _repository.signIn(params: params);
  }
}
