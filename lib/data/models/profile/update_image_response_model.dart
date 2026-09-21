import 'package:varadvani/data/models/profile/update_image_data_model.dart';
import 'package:varadvani/domain/entities/profile/update_image_response_entity.dart';

class UpdateImageResponseModel extends UpdateImageResponseEntity {
  UpdateImageResponseModel({
    required super.success,
    required super.message,
    required super.data,
    required super.error,
  });

  factory UpdateImageResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateImageResponseModel(
        success: json['success'] as bool? ?? false,
        message: json['message']?.toString() ?? '',
        data: UpdateImageDataModel.fromJson(json['data'] ?? {}),
        error: json['error']?.toString(),
      );
}
