import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desk/core/locator.dart';
import 'package:help_desk/core/widget/person_card.dart';
import 'package:help_desk/feature/list_screen/list_screen_bloc.dart';

class ListScreen extends StatelessWidget {
  final bloc = locator.get<ListScreenBloc>();

  ListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListScreenBloc, ListScreenState>(
      bloc: bloc
        ..add(
            LoadDataEvent()), //немного прямолинейно. Тут могла быть проверка доступа к сети, нарпример
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: Center(
            child: state.error.isEmpty
                ?
                // ? Text('Hello')
                ListView.builder(
                    itemBuilder: (context, index) =>
                        PersonCard(state.userData[index]),
                    itemCount: state.userData.length,
                  )
                : Center(
                    child: Text(state.error.toString()),
                  ),
          )),
        );
      },
    );
  }
}
