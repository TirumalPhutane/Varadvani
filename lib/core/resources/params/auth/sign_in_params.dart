class SignInParams {
  SignInParams({
    required this.phoneNumber,
    required this.password,
    required this.countryCode,
  });

  final String password;
  final String phoneNumber;
  final String countryCode;

  Map<String, dynamic> toJson() => {
    'password': password,
    'phoneNumber': phoneNumber,
    'country_code': countryCode,
  };
}
