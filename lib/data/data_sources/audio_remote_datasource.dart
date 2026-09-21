import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/data/models/audio/audio_response_model.dart';
import 'package:varadvani/data/models/audio/shravya_list_response_model.dart';
import 'package:varadvani/data/models/audio/shravya_response_model.dart';

final audioRemoteDatasourceProvider = Provider<AudioRemoteDatasource>(
  (ref) => AudioRemoteDatasourceImpl(ref.read(dioClientProvider)),
);

abstract class AudioRemoteDatasource {
  Future<AudioResponseModel> getAudios(String category);
  Future<ShravyaResponseModel> getShravyaGranth();
  Future<ShravyaListResponseModel> getShravyaAudioList(String subCategory);
}

class AudioRemoteDatasourceImpl implements AudioRemoteDatasource {
  final DioClient _dioClient;
  AudioRemoteDatasourceImpl(this._dioClient);

  @override
  Future<AudioResponseModel> getAudios(String category) async {
    final response = await _dioClient.get(
      ApiConstants.getAudios,
      queryParams: {'category': category},
      requiresAuth: true,
    );

    return AudioResponseModel.fromJson(response.data);
  }

  @override
  Future<ShravyaResponseModel> getShravyaGranth() async {
    final response = await _dioClient.get(
      ApiConstants.getShravyaGranth,
      queryParams: {'category': 'Appa'},
      requiresAuth: true,
    );

    return ShravyaResponseModel.fromJson(response.data);
  }

  @override
  Future<ShravyaListResponseModel> getShravyaAudioList(
    String subCategory,
  ) async {
    final response = await _dioClient.get(
      ApiConstants.getShravyaList,
      queryParams: {'category': 'Appa', 'subcategory': subCategory},
      requiresAuth: true,
    );

    return ShravyaListResponseModel.fromJson(response.data);
  }
}
