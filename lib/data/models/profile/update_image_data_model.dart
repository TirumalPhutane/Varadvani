import 'package:varadvani/domain/entities/profile/update_image_data_entity.dart';

class UpdateImageDataModel extends UpdateImageDataEntity {
  UpdateImageDataModel({required super.imageUrl});

  UpdateImageDataModel.empty() : super.empty();

  factory UpdateImageDataModel.fromJson(Map<String, dynamic> json) =>
      UpdateImageDataModel(imageUrl: json['profile_url']?.toString() ?? '');
}
