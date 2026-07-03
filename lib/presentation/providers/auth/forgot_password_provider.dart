import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/usecases/auth/forgot_password_usecase.dart';

class ForgotPasswordState {
  final bool isLoading;
  final AuthResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const ForgotPasswordState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  ForgotPasswordState copyWith({
    bool? isLoading,
    AuthResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final ForgotPasswordUsecase _usecase;

  ForgotPasswordNotifier(this._usecase) : super(const ForgotPasswordState());

  Future<void> forgotPassword(SignInParams params) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(params);
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

  void reset() => state = const ForgotPasswordState();
}

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>(
      (ref) => ForgotPasswordNotifier(ref.read(forgotPasswordUsecaseProvider)),
    );
