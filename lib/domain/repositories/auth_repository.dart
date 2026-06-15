import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';

abstract class AuthRepository {
  Future<AuthResponseEntity> signUp({required SignUpParams params});
  Future<AuthResponseEntity> signIn({required SignInParams params});
}
