import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/data/data_sources/audio_remote_datasource.dart';
import 'package:varadvani/domain/entities/audio/audio_response_entity.dart';
import 'package:varadvani/domain/entities/audio/shravya_list_response_entity.dart';
import 'package:varadvani/domain/entities/audio/shravya_response_entity.dart';
import 'package:varadvani/domain/repositories/audio_repository.dart';

final audioRepositoryProvider = Provider<AudioRepository>(
  (ref) => AudioRepositoryImpl(ref.read(audioRemoteDatasourceProvider)),
);

class AudioRepositoryImpl implements AudioRepository {
  final AudioRemoteDatasource _datasource;
  AudioRepositoryImpl(this._datasource);

  @override
  Future<AudioResponseEntity> getAudios({required String category}) async {
    try {
      return await _datasource.getAudios(category);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<ShravyaResponseEntity> getShravyaGranth() async {
    try {
      return await _datasource.getShravyaGranth();
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<ShravyaListResponseEntity> getShravyaAudioList({
    required String subCategory,
  }) async {
    try {
      return await _datasource.getShravyaAudioList(subCategory);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }
}
