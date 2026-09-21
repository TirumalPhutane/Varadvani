import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/profile/update_image_response_entity.dart';
import 'package:varadvani/domain/usecases/profile/update_profile_image_usecase.dart';

class UpdateProfileImageState {
  final bool isLoading;
  final UpdateImageResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const UpdateProfileImageState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  UpdateProfileImageState copyWith({
    bool? isLoading,
    UpdateImageResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return UpdateProfileImageState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class UpdateProfileImageNotifier
    extends StateNotifier<UpdateProfileImageState> {
  final UpdateProfileImageUsecase _usecase;
  final StorageService _storageService;
  UpdateProfileImageNotifier(this._usecase, this._storageService)
    : super(const UpdateProfileImageState());

  Future<void> updateProfileImage(FormData formData) async {
    final userId = _storageService.getUserId();

    if (userId == null || userId.isEmpty) {
      state = state.copyWith(error: 'User ID not found');
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(formData: formData, id: userId);
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

  void reset() => state = const UpdateProfileImageState();
}

final updateProfileImageProvider =
    StateNotifierProvider<UpdateProfileImageNotifier, UpdateProfileImageState>(
      (ref) => UpdateProfileImageNotifier(
        ref.read(updateProfileImageUsecaseProvider),
        ref.read(storageServiceProvider),
      ),
    );
