import 'package:varadvani/domain/entities/audio/shravya_entity.dart';

class ShravyaResponseEntity {
  ShravyaResponseEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  final bool success;
  final String message;
  final List<ShravyaEntity> data;
  final String? error;
}
