import 'package:flutter/widgets.dart';

///Демо единого навигатора для проекта. Про Навигатор 2.0 в курсе, но уже не в этот раз
class GlobalNavigator {
  final GlobalKey<NavigatorState> _navigatorKey;

  GlobalNavigator(this._navigatorKey);

  Future<T> popAndPushNamed<T extends Object, TO extends Object>(
    String routeName, {
    @required TO result,
    @required Object arguments,
  }) {
    return _navigatorKey.currentState
        .popAndPushNamed(routeName, result: result, arguments: arguments);
  }

  Future<T> pushAndRemoveUntil<T extends Object>(
      Route<T> newRoute, RoutePredicate predicate) {
    return _navigatorKey.currentState.pushAndRemoveUntil(newRoute, predicate);
  }
//далее могут быть методы для pushNamed, pushNamedAndRemoveUntil и т.д.
}
