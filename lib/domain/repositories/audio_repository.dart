import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';

abstract class AudioRepository {
  Future<AudioResponseEntity> getAudios({required String category});
}
