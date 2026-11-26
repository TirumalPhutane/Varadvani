import 'package:varadvani/data/models/home/quote_model.dart';
import 'package:varadvani/domain/entities/home/quote_response_entity.dart';

class QuoteResponseModel extends QuoteResponseEntity {
  QuoteResponseModel({
    required super.success,
    required super.message,
    required super.data,
    required super.error,
  });

  factory QuoteResponseModel.fromJson(Map<String, dynamic> json) =>
      QuoteResponseModel(
        success: json['success'] as bool? ?? false,
        message: json['message']?.toString() ?? '',
        data: json['data'] != null
            ? QuoteModel.fromJson(json['data'] as Map<String, dynamic>)
            : QuoteModel.empty(),
        error: json['error']?.toString() ?? '',
      );
}
