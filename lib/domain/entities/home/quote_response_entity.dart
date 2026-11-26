import 'package:varadvani/domain/entities/home/quote_entity.dart';

class QuoteResponseEntity {
  const QuoteResponseEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  final bool success;
  final String message;
  final QuoteEntity data;
  final String? error;
}
