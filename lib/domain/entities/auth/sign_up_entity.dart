import 'package:varadvani/domain/entities/auth/user_entity.dart';

class SignUpEntity {
  const SignUpEntity({required this.message, required this.user});

  final String message;
  final UserEntity user;
}
