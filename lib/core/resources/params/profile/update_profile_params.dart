class UpdateProfileParams {
  const UpdateProfileParams({
    required this.id,
    required this.familyId,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
  });

  final String id;
  final String familyId;
  final String phoneNumber;
  final String email;
  final String address;
  final String city;
  final String state;
  final String country;
  final String pincode;

  Map<String, dynamic> toJson() => {
    'id': id,
    'family_custom_id': familyId,
    'phoneNumber': phoneNumber,
    'email': email,
    'address': address,
    'city': city,
    'state': state,
    'country': country,
    'pincode': pincode,
  };
}
