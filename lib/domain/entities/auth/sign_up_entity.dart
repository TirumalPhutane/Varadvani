import 'package:varadvani/domain/entities/auth/user_entity.dart';

class SignUpEntity {
  const SignUpEntity({
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
