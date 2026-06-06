class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final String city;
  final String country;
  final String state;
  final String pincode;
  final String countryCode;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.country,
    required this.state,
    required this.pincode,
    required this.countryCode,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'address': address,
    'city': city,
    'country': country,
    'state': state,
    'pincode': pincode,
    'country_code': countryCode,
  };
}
