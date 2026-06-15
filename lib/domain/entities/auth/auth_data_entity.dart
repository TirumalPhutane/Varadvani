import 'package:varadvani/domain/entities/auth/user_entity.dart';

class AuthDataEntity {
  const AuthDataEntity({
    required this.message,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  final String message;
  final UserEntity user;
  final String accessToken;
  final String refreshToken;
}
