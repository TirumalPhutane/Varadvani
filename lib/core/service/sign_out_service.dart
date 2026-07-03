import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/core/routes/app_routes.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/presentation/providers/auth/sign_in_provider.dart';
import 'package:varadvani/presentation/providers/auth/sign_up_provider.dart';
import 'package:varadvani/presentation/providers/profile/get_profile_provider.dart';
import 'package:varadvani/presentation/providers/profile/update_profile_provider.dart';

class SignOutService {
  final Ref _ref;

  SignOutService(this._ref);

  Future<void> signOut(BuildContext context) async {
    await _ref.read(storageServiceProvider).clearTokens();
    _ref.read(dioClientProvider).clearAuthToken();

    // Invalidate all user-related providers here
    _ref.invalidate(signInProvider);
    _ref.invalidate(signUpProvider);
    _ref.invalidate(getProfileProvider);
    _ref.invalidate(updateProfileProvider);

    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.signInScreen,
        (route) => false,
      );
    }
  }
}

final signOutServiceProvider = Provider<SignOutService>(
  (ref) => SignOutService(ref),
);
