import 'package:varadvani/domain/entities/audio/audio_entity.dart';

class CategoryEntity {
  CategoryEntity({required this.category, required this.items});

  CategoryEntity.empty();

  String category = '';
  List<AudioEntity> items = [];
}
