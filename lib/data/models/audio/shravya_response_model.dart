import 'package:varadvani/data/models/audio/shravya_model.dart';
import 'package:varadvani/domain/entities/audio/shravya_response_entity.dart';

class ShravyaResponseModel extends ShravyaResponseEntity {
  ShravyaResponseModel({
    required super.success,
    required super.message,
    required super.data,
    required super.error,
  });

  factory ShravyaResponseModel.fromJson(Map<String, dynamic> json) =>
      ShravyaResponseModel(
        success: json['success'] as bool? ?? false,
        message: json['message']?.toString() ?? '',
        data:
            (json['data'] as List<dynamic>?)
                ?.map((x) => ShravyaModel.fromJson(x as Map<String, dynamic>))
                .toList() ??
            <ShravyaModel>[],
        error: json['error']?.toString() ?? '',
      );
}
