import 'package:varadvani/data/models/auth/user_model.dart';
import 'package:varadvani/domain/entities/auth/auth_data_entity.dart';

class AuthDataModel extends AuthDataEntity {
  const AuthDataModel({
    required super.message,
    required super.accessToken,
    required super.user,
    required super.refreshToken,
  });

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => AuthDataModel(
    message: json['message']?.toString() ?? '',
    accessToken: json['accessToken']?.toString() ?? '',
    user: UserModel.fromJson(json['user']),
    refreshToken: json['refreshToken']?.toString() ?? '',
  );
}
