import 'package:varadvani/domain/entities/auth/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.address,
    required super.password,
    required super.personalCustomId,
    required super.familyCustomId,
    required super.role,
    required super.isFamilyHead,
    required super.city,
    required super.state,
    required super.country,
    required super.pincode,
    required super.createdAt,
    required super.updatedAt,
  });

  UserModel.empty() : super.empty();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    email: json['email']?.toString() ?? '',
    phoneNumber: json['phoneNumber']?.toString() ?? '',
    address: json['address']?.toString() ?? '',
    password: json['password']?.toString() ?? '',
    personalCustomId: json['personal_custom_id']?.toString() ?? '',
    familyCustomId: json['family_custom_id']?.toString() ?? '',
    role: json['role']?.toString() ?? '',
    isFamilyHead: json['isFamilyHead'] as bool? ?? false,
    city: json['city']?.toString() ?? '',
    state: json['state']?.toString() ?? '',
    country: json['country']?.toString() ?? '',
    pincode: json['pincode']?.toString() ?? '',
    createdAt: json['createdAt']?.toString() ?? '',
    updatedAt: json['updatedAt']?.toString() ?? '',
  );
}
