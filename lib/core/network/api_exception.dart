import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorCode;

  ApiException(this.message, {this.statusCode, this.errorCode});

  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;

  factory ApiException.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException('The request timed out. Please try again.');
      case DioExceptionType.connectionError:
        return ApiException(
            'Cannot reach the server. Check your connection and that the backend is running.');
      default:
        break;
    }

    final status = e.response?.statusCode;
    final data = e.response?.data;

    if (data is Map<String, dynamic>) {
      var message = '${data['message'] ?? 'Something went wrong'}';
      final details = data['details'];
      if (details is List && details.isNotEmpty && details.first is Map) {
        message = '${(details.first as Map)['message'] ?? message}';
      }
      return ApiException(message,
          statusCode: status, errorCode: data['errorCode'] as String?);
    }

    if (status == 401) {
      return ApiException('Your session has expired. Please log in again.',
          statusCode: 401);
    }
    if (status == 403) {
      return ApiException('You do not have permission to do this.',
          statusCode: 403);
    }
    if (status == 404) {
      return ApiException('The requested item was not found.',
          statusCode: 404);
    }
    if (status == 429) {
      return ApiException('Too many requests. Please wait and try again.',
          statusCode: 429);
    }
    if (status != null && status >= 500) {
      return ApiException('Server error. Please try again later.',
          statusCode: status);
    }
    return ApiException('Something went wrong. Please try again.',
        statusCode: status);
  }

  @override
  String toString() => message;
}