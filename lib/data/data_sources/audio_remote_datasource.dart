import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/data/models/audio/audio_response_model.dart';

final audioRemoteDatasourceProvider = Provider<AudioRemoteDatasource>(
  (ref) => AudioRemoteDatasourceImpl(ref.read(dioClientProvider)),
);

abstract class AudioRemoteDatasource {
  Future<AudioResponseModel> getAudios(String category);
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
}
