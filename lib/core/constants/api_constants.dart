class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://seva-ulhz.onrender.com';

  /// Auth
  static const String signUp = '/api/user/sign_up';
  static const String signIn = '/api/user/sign_in';
  static const String signOut = '/api/user/logout';

  /// Profile
  static const String userProfile = '/api/user/user_profile/';
  static const String updateProfile = '/api/user/update_profile';
  static const String deleteAccount = '/api/user/delete';
}
