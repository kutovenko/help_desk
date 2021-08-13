import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:help_desk/core/data/models/user_data.dart';
import 'package:help_desk/core/data/users_repository.dart';
import 'package:help_desk/core/http/result.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'list_screen_event.dart';
part 'list_screen_state.dart';

class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  final UsersRepository _usersRepository;

  ListScreenBloc({@required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(ListScreenState.initial());

  @override
  Stream<ListScreenState> mapEventToState(
    ListScreenEvent event,
  ) async* {
    //Их тут, скорее всего, будет больше, поэтому свитч
    switch (event.runtimeType) {
      case LoadDataEvent:
        yield* _fetchData();
        break;
    }
  }

  Stream<ListScreenState> _fetchData() async* {
    Result result = await _usersRepository.fetchUsersFromRemoteApi();
    if (result.isSuccess()) {
      List<UserData> users = result.asSuccess().value;
      yield state.copyWith(error: '', userData: users);
    } else {
      yield state.copyWith(
          error: result
              .asError()
              .error
              .toString()); //очень в лоб, представим, что здесь отдается вменяемое сообщение
    }
  }
}
