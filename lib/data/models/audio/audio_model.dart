import 'package:varadvani/domain/entities/audio/audio_entity.dart';

class AudioModel extends AudioEntity {
  AudioModel({
    required super.id,
    required super.title,
    required super.description,
    required super.file,
    required super.contentType,
    required super.thumbnail,
    required super.duration,
    required super.category,
    required super.subcategory,
    required super.createdAt,
    required super.updatedAt,
  });

  AudioModel.empty() : super.empty();

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
    id: json['id']?.toString() ?? '',
    title: json['title']?.toString() ?? '',
    description: json['description']?.toString() ?? '',
    file: json['file']?.toString() ?? '',
    contentType: json['contentType']?.toString() ?? '',
    thumbnail: json['thumbnail']?.toString() ?? '',
    duration: json['duration'] as int? ?? 0,
    category: json['category']?.toString() ?? '',
    subcategory: json['subcategory']?.toString() ?? '',
    createdAt: json['createdAt']?.toString() ?? '',
    updatedAt: json['updatedAt']?.toString() ?? '',
  );
}
