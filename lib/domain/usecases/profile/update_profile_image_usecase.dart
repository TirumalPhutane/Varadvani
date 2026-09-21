import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/user_repository_impl.dart';
import 'package:varadvani/domain/entities/profile/update_image_response_entity.dart';
import 'package:varadvani/domain/repositories/user_repository.dart';

final updateProfileImageUsecaseProvider = Provider<UpdateProfileImageUsecase>(
  (ref) => UpdateProfileImageUsecase(ref.read(userRepositoryProvider)),
);

class UpdateProfileImageUsecase {
  final UserRepository _repository;
  UpdateProfileImageUsecase(this._repository);

  Future<UpdateImageResponseEntity> call({
    required FormData formData,
    required String id,
  }) {
    return _repository.updateProfileImage(formData: formData, id: id);
  }
}
