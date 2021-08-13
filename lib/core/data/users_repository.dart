import 'package:flutter/cupertino.dart';
import 'package:help_desk/core/data/models/user_data.dart';
import 'package:help_desk/core/data/some_api_repository.dart';
import 'package:help_desk/core/exception/server_exception.dart';
import 'package:help_desk/core/http/result.dart';

///Класс, чтобы показать два уровня абстракции, здесь могли быть задействованы и другие репозитории, например, для локальных данных
///По-хорошему, для объявления методов здесь можно использовать миксин
class UsersRepository {
  final SomeApiRepository someApiRepository;

  UsersRepository({@required this.someApiRepository});

  //Условно. В демо просто прокидываем результат дальше
  Future<Result<List<UserData>, ServerException>>
      fetchUsersFromRemoteApi() async {
    return await someApiRepository.fetchUsersFromApi();
  }
}
