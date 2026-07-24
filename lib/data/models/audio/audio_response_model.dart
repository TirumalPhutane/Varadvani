import 'package:varadvani/data/models/audio/category_model.dart';
import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';

class AudioResponseModel extends AudioResponseEntity {
  AudioResponseModel({
    required super.success,
    required super.message,
    required super.data,
    required super.error,
  });

  factory AudioResponseModel.fromJson(Map<String, dynamic> json) =>
      AudioResponseModel(
        success: json['success'] as bool? ?? false,
        message: json['message']?.toString() ?? '',
        data:
            (json['data'] as List<dynamic>?)
                ?.map((x) => CategoryModel.fromJson(x as Map<String, dynamic>))
                .toList() ??
            <CategoryModel>[],
        error: json['error']?.toString() ?? '',
      );
}
