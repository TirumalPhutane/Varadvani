import 'package:varadvani/domain/entities/auth/user_entity.dart';

class AuthDataEntity {
  AuthDataEntity({
    required this.message,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  AuthDataEntity.empty();

  String message = '';
  UserEntity user = UserEntity.empty();
  String accessToken = '';
  String refreshToken = '';
}
