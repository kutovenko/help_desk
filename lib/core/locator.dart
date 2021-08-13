import 'package:get_it/get_it.dart';
import 'package:help_desk/core/data/some_api_repository.dart';
import 'package:help_desk/core/data/users_repository.dart';
import 'package:help_desk/core/environment.dart';
import 'package:help_desk/core/http/dio_provider.dart';
import 'package:help_desk/feature/list_screen/list_screen_bloc.dart';

import 'navigation/global_navigator.dart';

final GetIt locator = GetIt.instance;

void setupLocator(GlobalNavigator globalNavigator, Environment environment) {
  locator.reset();

  locator.registerSingleton(globalNavigator);
  locator.registerSingleton(environment);
  locator.registerLazySingleton<DioProvider>(
      () => DioProvider(environment: locator.get())..configureDio());

  locator.registerFactory(
      () => SomeApiRepository(dioClient: locator.get<DioProvider>().dio));
  locator
      .registerFactory(() => UsersRepository(someApiRepository: locator.get()));

  locator.registerFactory(() => ListScreenBloc(usersRepository: locator.get()));
}
