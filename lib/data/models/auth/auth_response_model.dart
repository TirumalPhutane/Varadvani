import 'package:varadvani/data/models/auth/auth_data_model.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel({
    required super.success,
    required super.message,
    required super.data,
    required super.error,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        success: json['success'] as bool? ?? false,
        message: json['message']?.toString() ?? '',
        data: json['data'] != null
            ? AuthDataModel.fromJson(json['data'] as Map<String, dynamic>)
            : AuthDataModel.empty(),
        error: json['error']?.toString() ?? '',
      );
}
