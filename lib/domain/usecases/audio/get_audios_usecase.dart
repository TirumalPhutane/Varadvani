import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/audio_repository_impl.dart';
import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';
import 'package:varadvani/domain/repositories/audio_repository.dart';

final getAudiosUsecaseProvider = Provider<GetAudiosUsecase>(
  (ref) => GetAudiosUsecase(ref.read(audioRepositoryProvider)),
);

class GetAudiosUsecase {
  final AudioRepository _repository;
  GetAudiosUsecase(this._repository);

  Future<AudioResponseEntity> call(String category) {
    return _repository.getAudios(category: category);
  }
}
