import 'package:varadvani/data/models/auth/user_model.dart';
import 'package:varadvani/domain/entities/auth/auth_data_entity.dart';

class AuthDataModel extends AuthDataEntity {
  AuthDataModel({
    required super.message,
    required super.accessToken,
    required super.user,
    required super.refreshToken,
  });

  AuthDataModel.empty() : super.empty();

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => AuthDataModel(
    message: json['message']?.toString() ?? '',
    accessToken: json['accessToken']?.toString() ?? '',
    user: json['user'] != null
        ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
        : UserModel.empty(),
    refreshToken: json['refreshToken']?.toString() ?? '',
  );
}
