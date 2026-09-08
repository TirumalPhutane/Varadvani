import 'package:varadvani/domain/entities/audio/audio_entity.dart';

class ShravyaEntity {
  ShravyaEntity({required this.granth, required this.items});

  ShravyaEntity.empty();

  String granth = '';
  List<AudioEntity> items = [];
}
