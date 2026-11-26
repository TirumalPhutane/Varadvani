import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/data/data_sources/home_remote_datasource.dart';
import 'package:varadvani/data/models/home/quote_response_model.dart';
import 'package:varadvani/domain/repositories/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(ref.read(homeRemoteDatasourceProvider)),
);

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _datasource;
  HomeRepositoryImpl(this._datasource);

  @override
  Future<QuoteResponseModel> getQuote({required String day}) async {
    try {
      return await _datasource.getQuote(day);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }
}
