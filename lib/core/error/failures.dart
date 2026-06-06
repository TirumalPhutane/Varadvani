class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException({super.message = 'No internet connection.'});
}

class ServerException extends AppException {
  final List<String> errors;

  ServerException({
    required super.message,
    super.statusCode,
    this.errors = const [],
  });
}
