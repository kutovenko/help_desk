import 'package:dio/dio.dart';
import 'package:help_desk/global_constants.dart';

class UserAgentInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final appName =
        APP_NAME; //тут, например,  могла бы быть инфа о клиентском девайсе, каки-то реферальные ссылки и т.д.

    final userAgent = '$appName';
    options.headers.addAll({
      'user-agent': userAgent,
      'content-type': 'application/json',
      'accept': 'application/json',
    });
    handler.next(options);
  }
}
