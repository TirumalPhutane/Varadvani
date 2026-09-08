import 'package:varadvani/data/models/audio/audio_model.dart';
import 'package:varadvani/domain/entities/audio/shravya_entity.dart';

class ShravyaModel extends ShravyaEntity {
  ShravyaModel({required super.granth, required super.items});

  ShravyaModel.empty() : super.empty();

  factory ShravyaModel.fromJson(Map<String, dynamic> json) => ShravyaModel(
    granth: json['granth']?.toString() ?? '',
    items:
        (json['items'] as List<dynamic>?)
            ?.map((x) => AudioModel.fromJson(x as Map<String, dynamic>))
            .toList() ??
        <AudioModel>[],
  );
}
