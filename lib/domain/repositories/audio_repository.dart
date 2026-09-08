import 'package:varadvani/data/models/audio/shravya_response_model.dart';
import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';

abstract class AudioRepository {
  Future<AudioResponseEntity> getAudios({required String category});
  Future<ShravyaResponseModel> getShravyaGranth();
}
