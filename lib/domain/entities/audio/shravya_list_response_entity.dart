import 'package:varadvani/domain/entities/audio/audio_entity.dart';

class ShravyaListResponseEntity {
  ShravyaListResponseEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  final bool success;
  final String message;
  final List<AudioEntity> data;
  final String? error;
}
