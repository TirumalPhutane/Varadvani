import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/audio_repository_impl.dart';
import 'package:varadvani/domain/entities/audio/shravya_list_response_entity.dart';
import 'package:varadvani/domain/repositories/audio_repository.dart';

final getShravyaListUsecaseProvider = Provider<GetShravyaListUsecase>(
  (ref) => GetShravyaListUsecase(ref.read(audioRepositoryProvider)),
);

class GetShravyaListUsecase {
  final AudioRepository _repository;
  GetShravyaListUsecase(this._repository);

  Future<ShravyaListResponseEntity> call({required String subCategory}) {
    return _repository.getShravyaAudioList(subCategory: subCategory);
  }
}
