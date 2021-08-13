import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:help_desk/core/environment.dart';
import 'package:help_desk/core/locator.dart';
import 'package:help_desk/core/navigation/global_navigator.dart';
import 'package:help_desk/feature/list_screen/list_screen.dart';
import 'package:help_desk/global_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]) // для надежной работы этой фичи необходимо также внести прямые правки в нативку, в демо это условно опустил
      .then((value) => runApp(MyApp(Environment(baseUrl: AppUrls.BASE_URL))));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final Environment _environment;

  MyApp(this._environment);

  @override
  Widget build(BuildContext context) {
    var globalNavigator = GlobalNavigator(_navigatorKey);
    setupLocator(globalNavigator, _environment);

    //здесь можно подключать стринговые ресурсы, динамически менять тему оформления и т.д.

    return AppWidget(_navigatorKey);
  }
}

class AppWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey;

  AppWidget(this._navigatorKey);

  @override
  Widget build(BuildContext context) {
    //убираем клавиатуру
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        }
      },
      child: MaterialApp(
        title: APP_NAME,
        navigatorKey: _navigatorKey,
        initialRoute: RouteNames.ROOT,
        routes: {
          RouteNames.ROOT: (context) => ListScreen(),
          // RouteNames.LIST: (context) => OnBoardingScreen(),
        },
      ),
    );
  }
}
