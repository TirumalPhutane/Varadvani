class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.personalCustomId,
    required this.familyCustomId,
    required this.role,
    required this.isFamilyHead,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.createdAt,
    required this.updatedAt,
  });

  UserEntity.empty();

  String id = '';
  String name = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String password = '';
  String personalCustomId = '';
  String familyCustomId = '';
  String role = '';
  bool isFamilyHead = false;
  String city = '';
  String state = '';
  String country = '';
  String pincode = '';
  String createdAt = '';
  String updatedAt = '';
}
