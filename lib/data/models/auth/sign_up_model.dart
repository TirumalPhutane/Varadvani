import 'package:varadvani/data/models/auth/user_model.dart';
import 'package:varadvani/domain/entities/auth/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  const SignUpModel({required super.message, required super.user});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    message: json['message'] ?? '',
    user: UserModel.fromJson(json['user']),
  );
}
