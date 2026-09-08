import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/core/service/storage_service.dart';
import 'package:varadvani/domain/entities/auth/auth_response_entity.dart';
import 'package:varadvani/domain/usecases/profile/get_profile_usecase.dart';

class ProfileState {
  final bool isLoading;
  final AuthResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const ProfileState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  ProfileState copyWith({
    bool? isLoading,
    AuthResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class GetProfileNotifier extends StateNotifier<ProfileState> {
  final GetProfileUsecase _usecase;
  final StorageService _storageService;
  GetProfileNotifier(this._usecase, this._storageService)
    : super(const ProfileState());

  Future<void> getProfile() async {
    final userId = _storageService.getUserId();

    if (userId == null || userId.isEmpty) {
      state = state.copyWith(error: 'User ID not found');
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(userId);
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

  void setProfile(AuthResponseEntity data) {
    state = state.copyWith(data: data);
  }

  void reset() => state = const ProfileState();
}

final getProfileProvider =
    StateNotifierProvider<GetProfileNotifier, ProfileState>(
      (ref) => GetProfileNotifier(
        ref.read(getProfileUsecaseProvider),
        ref.read(storageServiceProvider),
      ),
    );
