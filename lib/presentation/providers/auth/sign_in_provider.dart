import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/auth/sign_up_entity.dart';
import 'package:varadvani/domain/usecases/auth/sign_in_usecase.dart';

class SignInState {
  final bool isLoading;
  final SignUpEntity? data;
  final String? error;
  final List<String> validationErrors;

  const SignInState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  SignInState copyWith({
    bool? isLoading,
    SignUpEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class SignInNotifier extends StateNotifier<SignInState> {
  final SignInUsecase _usecase;
  final StorageService _storageService;
  final DioClient _dioClient;

  SignInNotifier(this._usecase, this._storageService, this._dioClient)
    : super(const SignInState());

  Future<void> signIn(SignInParams params) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(params);

      await _storageService.saveTokens(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );

      _dioClient.setAuthToken(result.accessToken);

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

  void reset() => state = const SignInState();
}

final signInProvider = StateNotifierProvider<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(
    ref.read(signInUsecaseProvider),
    ref.read(storageServiceProvider),
    ref.read(dioClientProvider),
  ),
);
