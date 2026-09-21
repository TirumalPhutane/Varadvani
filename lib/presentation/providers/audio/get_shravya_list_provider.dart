import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/domain/entities/audio/shravya_list_response_entity.dart';
import 'package:varadvani/domain/usecases/audio/get_shravya_list_usecase.dart';

class ShravyaListState {
  final bool isLoading;
  final ShravyaListResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const ShravyaListState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  ShravyaListState copyWith({
    bool? isLoading,
    ShravyaListResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return ShravyaListState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class GetShravyaListNotifier extends StateNotifier<ShravyaListState> {
  final GetShravyaListUsecase _usecase;

  GetShravyaListNotifier(this._usecase) : super(const ShravyaListState());

  Future<void> getShravyaAudioList(String subCategory) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(subCategory: subCategory);
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

  void reset() => state = const ShravyaListState();
}

final getShravyaListProvider =
    StateNotifierProvider<GetShravyaListNotifier, ShravyaListState>(
      (ref) => GetShravyaListNotifier(ref.read(getShravyaListUsecaseProvider)),
    );
