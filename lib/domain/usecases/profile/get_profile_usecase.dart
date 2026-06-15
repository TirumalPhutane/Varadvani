import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/user_repository_impl.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/user_repository.dart';

final getProfileUsecaseProvider = Provider<GetProfileUsecase>(
  (ref) => GetProfileUsecase(ref.read(userRepositoryProvider)),
);

class GetProfileUsecase {
  final UserRepository _repository;
  GetProfileUsecase(this._repository);

  Future<AuthResponseEntity> call(String id) {
    return _repository.getProfile(id: id);
  }
}
