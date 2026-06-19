import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/core/resources/params/profile/update_profile_params.dart';
import 'package:varadvani/data/models/auth/auth_response_model.dart';

final userRemoteDatasourceProvider = Provider<UserRemoteDatasource>(
  (ref) => UserRemoteDatasourceImpl(ref.read(dioClientProvider)),
);

abstract class UserRemoteDatasource {
  Future<AuthResponseModel> getProfile(String id);
  Future<AuthResponseModel> updateProfile(UpdateProfileParams params);
  Future<AuthResponseModel> deleteProfile(String id);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final DioClient _dioClient;
  UserRemoteDatasourceImpl(this._dioClient);

  @override
  Future<AuthResponseModel> getProfile(String id) async {
    final response = await _dioClient.get(
      '${ApiConstants.userProfile}$id',
      requiresAuth: true,
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> updateProfile(UpdateProfileParams params) async {
    final response = await _dioClient.patch(
      ApiConstants.updateProfile,
      data: params.toJson(),
      requiresAuth: true,
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> deleteProfile(String id) async {
    final response = await _dioClient.delete(
      '${ApiConstants.deleteProfile}$id',
      requiresAuth: true,
    );
    return AuthResponseModel.fromJson(response.data);
  }
}
