import 'package:dio/dio.dart';
import '../api_repository/api_repository.dart';

class DioExceptions implements Exception {

  DioExceptions.fromDioError({required DioException dioError}) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.connectionError:
        message = "connectionError";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        message = _handleError(dioError.response!.statusCode!, dioError.response!.data);
        break;
    }
  }

  String message='';

  String _handleError(int statusCode, dynamic errorData) {

    if (errorData is Map<String, dynamic>) {
      if (errorData.containsKey('message')) {
        return errorData['message'] as String;
      }
      return "Something went wrong";
    }else{
      switch (statusCode) {
        case 400:
          return "Bad Request";
        case 401:

          return "Session Expired Please";
        case 403:
          return "Session Expired Please";
        case 404:
          return "Service Not Found";
        case 500:
          return 'Internal server error';
        case 502:
          return 'An invalid response was received from the upstream server';
        default:
          return 'Something went wrong';
      }
    }
  }

  @override
  String toString() => message;


  static Future<dynamic> unauthorized(Future<dynamic> Function()? callback) async {
    return await Repository().refreshToken(callback!);
  }
}