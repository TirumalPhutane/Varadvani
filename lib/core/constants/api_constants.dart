class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://seva-2vgn.onrender.com';

  ///Token
  static const String refreshToken = '/api/user/refresh_token';

  /// Auth
  static const String signUp = '/api/user/sign_up';
  static const String signIn = '/api/user/sign_in';
  static const String signOut = '/api/user/logout';
  static const String forgotPassword = '/api/user/forgot_password';

  /// Profile
  static const String userProfile = '/api/user/user_profile/';
  static const String updateProfile = '/api/user/update_profile';
  static const String deleteProfile = '/api/user/delete_profile/';

  ///Audio
  static const String getAudios = '/api/media/categoryData';
  static const String getShravyaGranth = '/api/media/shravyaGranthData';
}
