import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:varadvani/data/repositories/home_repository_impl.dart';
import 'package:varadvani/domain/entities/home/quote_response_entity.dart';
import 'package:varadvani/domain/repositories/home_repository.dart';

final getQuoteUsecaseProvider = Provider<GetQuoteUsecase>(
  (ref) => GetQuoteUsecase(ref.read(homeRepositoryProvider)),
);

class GetQuoteUsecase {
  final HomeRepository _repository;
  GetQuoteUsecase(this._repository);

  Future<QuoteResponseEntity> call(String day) {
    return _repository.getQuote(day: day);
  }
}
