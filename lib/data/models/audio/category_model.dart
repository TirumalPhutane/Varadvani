import 'package:varadvani/data/models/audio/audio_model.dart';
import 'package:varadvani/domain/entities/audio/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.category, required super.items});

  CategoryModel.empty() : super.empty();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    category: json['category']?.toString() ?? '',
    items:
        (json['items'] as List<dynamic>?)
            ?.map((x) => AudioModel.fromJson(x as Map<String, dynamic>))
            .toList() ??
        <AudioModel>[],
  );
}
