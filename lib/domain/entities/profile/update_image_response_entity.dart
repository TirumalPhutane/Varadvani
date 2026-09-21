import 'package:varadvani/domain/entities/profile/update_image_data_entity.dart';

class UpdateImageResponseEntity {
  const UpdateImageResponseEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  final bool success;
  final String message;
  final UpdateImageDataEntity data;
  final String? error;
}
