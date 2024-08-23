import 'package:dio/dio.dart';

class Failure {
  final String message;
  final int? code;

  Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(code: $code, message: $message)';

  factory Failure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(message: "Connection Timeout", code: 408);
      case DioExceptionType.sendTimeout:
        return Failure(message: "Send Timeout", code: 408);
      case DioExceptionType.receiveTimeout:
        return Failure(message: "Receive Timeout", code: 408);
      case DioExceptionType.badResponse:
        return Failure(
          message: dioException.response?.statusMessage ?? "Received invalid status code: ${dioException.response?.statusCode}",
          code: dioException.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return Failure(message: "Request Cancelled", code: null);
      case DioExceptionType.unknown:
        return Failure(message: "Unexpected Error: ${dioException.message}", code: null);
      default:
        return Failure(message: "Something went wrong", code: null);
    }
  }
}