import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/domain/entities/auth/sign_up_entity.dart';

abstract class AuthRepository {
  Future<SignUpEntity> signUp({required SignUpParams params});
}
