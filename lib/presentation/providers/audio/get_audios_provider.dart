import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';
import 'package:varadvani/domain/usecases/audio/get_audios_usecase.dart';

class AudiosState {
  final bool isLoading;
  final AudioResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const AudiosState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  AudiosState copyWith({
    bool? isLoading,
    AudioResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return AudiosState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class GetAudiosNotifier extends StateNotifier<AudiosState> {
  final GetAudiosUsecase _usecase;

  GetAudiosNotifier(this._usecase) : super(const AudiosState());

  Future<void> getAudios(String category) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(category);
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

  void reset() => state = const AudiosState();
}

final getAudiosProvider = StateNotifierProvider<GetAudiosNotifier, AudiosState>(
  (ref) => GetAudiosNotifier(ref.read(getAudiosUsecaseProvider)),
);
