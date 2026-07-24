import 'package:varadvani/domain/entities/audio/category_entity.dart';

class AudioResponseEntity {
  AudioResponseEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  final bool success;
  final String message;
  final List<CategoryEntity> data;
  final String? error;
}
