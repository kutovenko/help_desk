part of 'list_screen_bloc.dart';

///Ванильный блок. В боевых неплохо использовать freezed
class ListScreenState extends Equatable {
  String error;
  List<UserData> userData;

  ListScreenState({@required this.error, @required this.userData});

  @override
  List<Object> get props => [error, userData];

  factory ListScreenState.initial() {
    return ListScreenState(error: '', userData: []);
  }

  ListScreenState copyWith(
      {bool isLoading, String error, List<UserData> userData}) {
    return ListScreenState(
        error: error ?? this.error, userData: userData ?? this.userData);
  }
}
