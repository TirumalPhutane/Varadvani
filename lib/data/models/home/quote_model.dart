import 'package:varadvani/domain/entities/home/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  QuoteModel({required super.id, required super.day, required super.quote});

  QuoteModel.empty() : super.empty();

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    id: json['_id']?.toString() ?? '',
    day: json['day']?.toString() ?? '',
    quote: json['quote']?.toString() ?? '',
  );
}
