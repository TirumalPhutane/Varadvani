import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/audio_repository_impl.dart';
import 'package:varadvani/domain/entities/audio/shravya_response_entity.dart';
import 'package:varadvani/domain/repositories/audio_repository.dart';

final getShravyaUsecaseProvider = Provider<GetShravyaUsecase>(
  (ref) => GetShravyaUsecase(ref.read(audioRepositoryProvider)),
);

class GetShravyaUsecase {
  final AudioRepository _repository;
  GetShravyaUsecase(this._repository);

  Future<ShravyaResponseEntity> call() {
    return _repository.getShravyaGranth();
  }
}
