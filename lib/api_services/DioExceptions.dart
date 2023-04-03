import 'package:dio/dio.dart';
import '../api_repository/api_repository.dart';

class DioExceptions implements Exception {

  DioExceptions.fromDioError({required DioError dioError}) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.badResponse:
        message = _handleError(dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String message='';

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      case 401:
         return error["message"];
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;


  static Future<dynamic> unauthorized(Future<dynamic> Function()? callback) async {
    return await Repository().refreshToken(callback!);
  }
}