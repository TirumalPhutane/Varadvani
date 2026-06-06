import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/domain/entities/auth/sign_up_entity.dart';
import 'package:varadvani/domain/usecases/auth/sign_up_usecase.dart';

class SignUpState {
  final bool isLoading;
  final SignUpEntity? data;
  final String? error;
  final List<String> validationErrors;

  const SignUpState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  SignUpState copyWith({
    bool? isLoading,
    SignUpEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpUsecase _usecase;
  SignUpNotifier(this._usecase) : super(const SignUpState());

  Future<void> signUp(SignUpParams params) async {
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

  void reset() => state = const SignUpState();
}

final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(ref.read(signUpUsecaseProvider)),
);
