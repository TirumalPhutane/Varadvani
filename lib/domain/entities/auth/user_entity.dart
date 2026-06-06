class UserEntity {
  const UserEntity({
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

  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String password;
  final String personalCustomId;
  final String familyCustomId;
  final String role;
  final bool isFamilyHead;
  final String city;
  final String state;
  final String country;
  final String pincode;
  final String createdAt;
  final String updatedAt;
}
