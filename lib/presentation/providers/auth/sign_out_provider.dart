import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/resources/params/auth/sign_out_params.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/usecases/auth/sign_out_usecase.dart';

class SignOutState {
  final bool isLoading;
  final AuthResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const SignOutState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  SignOutState copyWith({
    bool? isLoading,
    AuthResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return SignOutState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class SignOutNotifier extends StateNotifier<SignOutState> {
  final SignOutUsecase _usecase;
  final StorageService _storageService;

  SignOutNotifier(this._usecase, this._storageService)
    : super(const SignOutState());

  Future<void> signOut() async {
    final refreshToken = _storageService.getUserId();

    if (refreshToken == null || refreshToken.isEmpty) {
      state = state.copyWith(error: 'Refresh Token not found');
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(SignOutParams(refreshToken: refreshToken));

      if (result.success) {
        _storageService.clearTokens();
      }

      state = state.copyWith(isLoading: false, data: result);
    } on ServerException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
        validationErrors: e.errors,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const SignOutState();
}

final signOutProvider = StateNotifierProvider<SignOutNotifier, SignOutState>(
  (ref) => SignOutNotifier(
    ref.read(signOutUsecaseProvider),
    ref.read(storageServiceProvider),
  ),
);
