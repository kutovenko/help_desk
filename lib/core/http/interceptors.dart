import 'package:dio/dio.dart';

class UserAgentInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //тут, например,  могла бы быть инфа о клиентском девайсе, каки-то реферальные ссылки и т.д.

    options.headers.addAll({
      'content-type': 'application/json',
      'accept': 'application/json',
    });
    handler.next(options);
  }
}
