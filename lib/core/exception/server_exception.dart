import 'package:dio/dio.dart';

///Простая обертка над стандартным исключением
class ServerException implements Exception {
  String message;

  ServerException(this.message);

  //экстеншен для получения сообщения внешнего исключения
  ServerException.fromDioError(DioError error) {
    message = error.message;
  }
}
