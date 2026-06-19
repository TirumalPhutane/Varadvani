import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/usecases/profile/delete_profile_usecase.dart';

class DeleteProfileState {
  const DeleteProfileState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  final bool isLoading;
  final AuthResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  DeleteProfileState copyWith({
    bool? isLoading,
    AuthResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return DeleteProfileState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class DeleteProfileNotifier extends StateNotifier<DeleteProfileState> {
  final DeleteProfileUsecase _usecase;
  final StorageService _storageService;
  DeleteProfileNotifier(this._usecase, this._storageService)
    : super(const DeleteProfileState());

  Future<void> deleteProfile() async {
    final userId = _storageService.getUserId();

    if (userId == null || userId.isEmpty) {
      state = state.copyWith(error: 'User ID not found');
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(userId);

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

  void reset() => state = const DeleteProfileState();
}

final deleteProfileProvider =
    StateNotifierProvider<DeleteProfileNotifier, DeleteProfileState>(
      (ref) => DeleteProfileNotifier(
        ref.read(deleteProfileUsecaseProvider),
        ref.read(storageServiceProvider),
      ),
    );
