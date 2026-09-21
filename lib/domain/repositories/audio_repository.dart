import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';
import 'package:varadvani/domain/entities/audio/shravya_list_response_entity.dart';
import 'package:varadvani/domain/entities/audio/shravya_response_entity.dart';

abstract class AudioRepository {
  Future<AudioResponseEntity> getAudios({required String category});
  Future<ShravyaResponseEntity> getShravyaGranth();
  Future<ShravyaListResponseEntity> getShravyaAudioList({
    required String subCategory,
  });
}
