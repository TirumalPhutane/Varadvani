import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/core/resources/params/auth/sign_in_params.dart';
import 'package:varadvani/core/resources/params/auth/sign_up_params.dart';
import 'package:varadvani/data/models/auth/sign_up_model.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>(
  (ref) => AuthRemoteDatasourceImpl(ref.read(dioClientProvider)),
);

abstract class AuthRemoteDatasource {
  Future<SignUpModel> signUp(SignUpParams params);
  Future<SignUpModel> signIn(SignInParams params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _dioClient;
  AuthRemoteDatasourceImpl(this._dioClient);

  @override
  Future<SignUpModel> signUp(SignUpParams params) async {
    final response = await _dioClient.post(
      ApiConstants.signUp,
      data: params.toJson(),
    );
    return SignUpModel.fromJson(response.data);
  }

  @override
  Future<SignUpModel> signIn(SignInParams params) async {
    final response = await _dioClient.post(
      ApiConstants.signIn,
      data: params.toJson(),
    );
    return SignUpModel.fromJson(response.data);
  }
}
