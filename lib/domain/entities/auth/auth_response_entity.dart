import 'package:varadvani/domain/entities/auth/auth_data_entity.dart';

class AuthResponseEntity {
  const AuthResponseEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
    required this.code,
  });

  final bool success;
  final String message;
  final AuthDataEntity data;
  final String? error;
  final String code;
}
