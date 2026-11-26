import 'package:flutter_riverpod/legacy.dart';
import 'package:varadvani/core/error/failures.dart';
import 'package:varadvani/domain/entities/home/quote_response_entity.dart';
import 'package:varadvani/domain/usecases/home/get_quote_usecase.dart';

class QuoteState {
  final bool isLoading;
  final QuoteResponseEntity? data;
  final String? error;
  final List<String> validationErrors;

  const QuoteState({
    this.isLoading = false,
    this.data,
    this.error,
    this.validationErrors = const [],
  });

  QuoteState copyWith({
    bool? isLoading,
    QuoteResponseEntity? data,
    String? error,
    List<String>? validationErrors,
  }) {
    return QuoteState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
      validationErrors: validationErrors ?? [],
    );
  }
}

class GetQuoteNotifier extends StateNotifier<QuoteState> {
  final GetQuoteUsecase _usecase;

  GetQuoteNotifier(this._usecase) : super(const QuoteState());

  Future<void> getQuote(String day) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _usecase(day);
      state = state.copyWith(isLoading: false, data: result);
    } on ServerException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
        validationErrors: e.errors,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const QuoteState();
}

final getQuoteProvider = StateNotifierProvider<GetQuoteNotifier, QuoteState>(
  (ref) => GetQuoteNotifier(ref.read(getQuoteUsecaseProvider)),
);
