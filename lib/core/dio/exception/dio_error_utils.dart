// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';

String handleDioError(DioError error) {
  const defaultError = 'Unknown error occurred';
  switch (error.type) {
    case DioErrorType.cancel:
      return 'Request to API server was cancelled';
    case DioErrorType.connectionTimeout:
      return 'Connection timeout with API server';
    case DioErrorType.receiveTimeout:
      return 'Receive timeout in connection with API server';
    case DioErrorType.sendTimeout:
      return 'Send timeout in connection with API server';
    case DioErrorType.unknown:
      return 'Connection to API server failed due to internet connection';
    default:
      return defaultError;
  }
}
