import 'package:flutter/cupertino.dart';
import 'package:help_desk/core/data/some_api_repository.dart';

///Класс, чтобы показать два уровня абстракции, здесь могли быть задействованы и другие репозитории, например, для локальных данных
class UsersRepository {
  final SomeApiRepository someApiRepository;

  UsersRepository({@required this.someApiRepository});
}
