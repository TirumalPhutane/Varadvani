import 'package:varadvani/core/resources/params/profile/update_profile_params.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';

abstract class UserRepository {
  Future<AuthResponseEntity> getProfile({required String id});
  Future<AuthResponseEntity> updateProfile({
    required UpdateProfileParams params,
  });
}
