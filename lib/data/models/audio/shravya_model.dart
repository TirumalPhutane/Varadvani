import 'package:varadvani/domain/entities/audio/shravya_entity.dart';

class ShravyaModel extends ShravyaEntity {
  ShravyaModel({required super.count, required super.subCategory});

  ShravyaModel.empty() : super.empty();

  factory ShravyaModel.fromJson(Map<String, dynamic> json) => ShravyaModel(
    count: json['count'] as int? ?? 0,
    subCategory: json['subcategory']?.toString() ?? '',
  );
}
