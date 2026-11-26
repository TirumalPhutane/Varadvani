import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/constants/api_constants.dart';
import 'package:varadvani/core/network/dio_client.dart';
import 'package:varadvani/data/models/home/quote_response_model.dart';

final homeRemoteDatasourceProvider = Provider<HomeRemoteDatasource>(
  (ref) => HomeRemoteDatasourceImpl(ref.read(dioClientProvider)),
);

abstract class HomeRemoteDatasource {
  Future<QuoteResponseModel> getQuote(String day);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final DioClient _dioClient;
  HomeRemoteDatasourceImpl(this._dioClient);

  @override
  Future<QuoteResponseModel> getQuote(String day) async {
    final response = await _dioClient.get(
      ApiConstants.getQuote,
      requiresAuth: true,
      queryParams: {'day': day},
    );
    return QuoteResponseModel.fromJson(response.data);
  }
}
