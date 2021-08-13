import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:help_desk/core/data/models/user_data.dart';
import 'package:help_desk/core/exception/server_exception.dart';
import 'package:help_desk/core/http/result.dart';
import 'package:help_desk/global_constants.dart';

///Класс для работы с внешним API
class SomeApiRepository {
  final Dio dioClient;

  SomeApiRepository({@required this.dioClient});

  Future<Result<List<UserData>, ServerException>> fetchUsersFromApi() async {
    try {
      var response = await dioClient.get(AppUrls.USERS);

      if (response.statusCode != 200) {
        //тут должен быть разбор ошибок по кодам и соответствующие им обработки
        //для демо-целей просто кидаем в лоб общее исключение
        throw ServerException('Ошибка сервера');
      } else {
        var products = response.data.map((entity) => UserData.fromJson(entity));
        return Success(List<UserData>.from(products));
      }
    } on DioError catch (e) {
      //тут тоже можно разбирать, что конкретно произошло, но мы просто используем экстеншен
      return Error(ServerException.fromDioError(e));
    }
  }
}
