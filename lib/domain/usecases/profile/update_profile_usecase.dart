import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/resources/params/profile/update_profile_params.dart';
import 'package:varadvani/data/repositories/user_repository_impl.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/repositories/user_repository.dart';

final updateProfileUsecaseProvider = Provider<UpdateProfileUsecase>(
  (ref) => UpdateProfileUsecase(ref.read(userRepositoryProvider)),
);

class UpdateProfileUsecase {
  final UserRepository _repository;
  UpdateProfileUsecase(this._repository);

  Future<AuthResponseEntity> call(UpdateProfileParams params) {
    return _repository.updateProfile(params: params);
  }
}
