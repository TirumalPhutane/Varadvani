import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/resources/params/profile/update_profile_params.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/usecases/profile/update_profile_usecase.dart';

class UpdateProfileState {
  final bool isLoading;
  final AuthResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const UpdateProfileState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  UpdateProfileState copyWith({
    bool? isLoading,
    AuthResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return UpdateProfileState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class UpdateProfileNotifier extends StateNotifier<UpdateProfileState> {
  final UpdateProfileUsecase _usecase;
  final StorageService _storageService;
  UpdateProfileNotifier(this._usecase, this._storageService)
    : super(const UpdateProfileState());

  Future<void> updateProfile(UpdateProfileParams params) async {
    final userId = _storageService.getUserId();

    if (userId == null || userId.isEmpty) {
      state = state.copyWith(error: 'User ID not found');
      return;
    }

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

  void reset() => state = const UpdateProfileState();
}

final updateProfileProvider =
    StateNotifierProvider<UpdateProfileNotifier, UpdateProfileState>(
      (ref) => UpdateProfileNotifier(
        ref.read(updateProfileUsecaseProvider),
        ref.read(storageServiceProvider),
      ),
    );
