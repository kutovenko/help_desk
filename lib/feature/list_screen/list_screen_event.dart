part of 'list_screen_bloc.dart';

///Ванильный блок. В боевых можно использовать freezed и Equatable

@immutable
abstract class ListScreenEvent {}

class LoadDataEvent extends ListScreenEvent {
  LoadDataEvent();
}
