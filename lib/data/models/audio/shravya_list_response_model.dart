import 'package:varadvani/data/models/audio/audio_model.dart';
import 'package:varadvani/domain/entities/audio/shravya_list_response_entity.dart';

class ShravyaListResponseModel extends ShravyaListResponseEntity {
  ShravyaListResponseModel({
    required super.success,
    required super.message,
    required super.data,
    required super.error,
  });

  factory ShravyaListResponseModel.fromJson(Map<String, dynamic> json) =>
      ShravyaListResponseModel(
        success: json['success'] as bool? ?? false,
        message: json['message']?.toString() ?? '',
        data:
            (json['data'] as List<dynamic>?)
                ?.map((x) => AudioModel.fromJson(x as Map<String, dynamic>))
                .toList() ??
            <AudioModel>[],
        error: json['error']?.toString() ?? '',
      );
}
