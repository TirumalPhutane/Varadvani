import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/domain/entities/audio/shravya_response_entity.dart';
import 'package:varadvani/domain/usecases/audio/get_shravya_usecase.dart';

class ShravyaGranthState {
  final bool isLoading;
  final ShravyaResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const ShravyaGranthState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  ShravyaGranthState copyWith({
    bool? isLoading,
    ShravyaResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return ShravyaGranthState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class GetShravyaNotifier extends StateNotifier<ShravyaGranthState> {
  final GetShravyaUsecase _usecase;

  GetShravyaNotifier(this._usecase) : super(const ShravyaGranthState());

  Future<void> getShravyaGranth() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase();
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

  void reset() => state = const ShravyaGranthState();
}

final getShravyaProvider =
    StateNotifierProvider<GetShravyaNotifier, ShravyaGranthState>(
      (ref) => GetShravyaNotifier(ref.read(getShravyaUsecaseProvider)),
    );
