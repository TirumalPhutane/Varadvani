class SignUpData {
  SignUpData({
    required this.countryCode,
    required this.mobileNumber,
    required this.password,
  });

  SignUpData.empty();

  String mobileNumber = '';
  String password = '';
  String countryCode = '';
}
