import 'package:varadvani/data/models/home/quote_response_model.dart';

abstract class HomeRepository {
  Future<QuoteResponseModel> getQuote({required String day});
}
