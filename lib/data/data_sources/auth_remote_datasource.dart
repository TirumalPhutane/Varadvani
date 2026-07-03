import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/core/resources/params/auth/sign_out_params.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/data/models/auth/auth_response_model.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>(
  (ref) => AuthRemoteDatasourceImpl(ref.read(dioClientProvider)),
);

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> signUp(SignUpParams params);
  Future<AuthResponseModel> signIn(SignInParams params);
  Future<AuthResponseModel> signOut(SignOutParams params);
  Future<AuthResponseModel> forgotPassword(SignInParams params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _dioClient;
  AuthRemoteDatasourceImpl(this._dioClient);

  @override
  Future<AuthResponseModel> signUp(SignUpParams params) async {
    final response = await _dioClient.post(
      ApiConstants.signUp,
      data: params.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> signIn(SignInParams params) async {
    final response = await _dioClient.post(
      ApiConstants.signIn,
      data: params.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> signOut(SignOutParams params) async {
    final response = await _dioClient.post(
      ApiConstants.signOut,
      data: params.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> forgotPassword(SignInParams params) async {
    final response = await _dioClient.patch(
      ApiConstants.forgotPassword,
      data: params.toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }
}
