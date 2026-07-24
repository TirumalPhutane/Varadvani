// lib/presentation/providers/audio/audio_player_provider.dart

import 'package:flutter_riverpod/legacy.dart';
import 'package:just_audio/just_audio.dart';
import 'package:varadvani/domain/entities/audio/audio_entity.dart';

class AudioPlayerState {
  final AudioEntity? currentAudio;
  final List<AudioEntity> playlist;
  final int currentIndex;
  final bool isPlaying;
  final bool isLoading;
  final Duration position;
  final Duration duration;

  const AudioPlayerState({
    this.currentAudio,
    this.playlist = const [],
    this.currentIndex = -1,
    this.isPlaying = false,
    this.isLoading = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  AudioPlayerState copyWith({
    AudioEntity? currentAudio,
    List<AudioEntity>? playlist,
    int? currentIndex,
    bool? isPlaying,
    bool? isLoading,
    Duration? position,
    Duration? duration,
  }) {
    return AudioPlayerState(
      currentAudio: currentAudio ?? this.currentAudio,
      playlist: playlist ?? this.playlist,
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }

  bool get hasNext => currentIndex >= 0 && currentIndex < playlist.length - 1;
  bool get hasPrevious => currentIndex > 0;
}

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  AudioPlayerNotifier() : super(const AudioPlayerState()) {
    _player.positionStream.listen((pos) {
      state = state.copyWith(position: pos);
    });

    _player.durationStream.listen((dur) {
      if (dur != null) {
        state = state.copyWith(duration: dur);
      }
    });

    _player.playerStateStream.listen((playerState) {
      state = state.copyWith(
        isPlaying: playerState.playing,
        isLoading:
            playerState.processingState == ProcessingState.loading ||
            playerState.processingState == ProcessingState.buffering,
      );

      // Auto play next track when current one finishes
      if (playerState.processingState == ProcessingState.completed) {
        if (state.hasNext) {
          playNext();
        } else {
          _player.seek(Duration.zero);
          _player.pause();
        }
      }

      _player.sequenceStateStream.listen((_) {});
    });
  }

  final AudioPlayer _player = AudioPlayer();

  Future<void> playAudio(AudioEntity audio, List<AudioEntity> playlist) async {
    final index = playlist.indexWhere((a) => a.file == audio.file);

    state = state.copyWith(
      currentAudio: audio,
      playlist: playlist,
      currentIndex: index,
      isLoading: true,
    );

    try {
      await _player.setUrl(audio.file);
      await _player.play();
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> skipForward({int seconds = 10}) async {
    final newPosition = state.position + Duration(seconds: seconds);
    final clamped = newPosition > state.duration ? state.duration : newPosition;
    await _player.seek(clamped);
  }

  Future<void> skipBackward({int seconds = 10}) async {
    final newPosition = state.position - Duration(seconds: seconds);
    final clamped = newPosition < Duration.zero ? Duration.zero : newPosition;
    await _player.seek(clamped);
  }

  Future<void> replay() async {
    await _player.seek(Duration.zero);
    await _player.play();
  }

  Future<void> playNext() async {
    if (!state.hasNext) return;
    final nextAudio = state.playlist[state.currentIndex + 1];
    await playAudio(nextAudio, state.playlist);
  }

  Future<void> playPrevious() async {
    if (!state.hasPrevious) return;
    final prevAudio = state.playlist[state.currentIndex - 1];
    await playAudio(prevAudio, state.playlist);
  }

  Future<void> stop() async {
    await _player.stop();
    state = const AudioPlayerState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
      (ref) => AudioPlayerNotifier(),
    );
