import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/user_repository_impl.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/user_repository.dart';

final deleteProfileUsecaseProvider = Provider<DeleteProfileUsecase>(
  (ref) => DeleteProfileUsecase(ref.read(userRepositoryProvider)),
);

class DeleteProfileUsecase {
  DeleteProfileUsecase(this._repository);

  final UserRepository _repository;

  Future<AuthResponseEntity> call(String id) {
    return _repository.deleteProfile(id: id);
  }
}
