import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:help_desk/core/environment.dart';
import 'package:help_desk/core/http/interceptors.dart';

class DioProvider {
  final Environment environment;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioProvider({@required this.environment});

  void configureDio() {
    var options = BaseOptions(
      baseUrl: environment.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio.options = options;
    _dio.interceptors.addAll([
      //Сугубо с демонстрационными целями. Тут, скорее всего, будет, как минимум, какой-нибудь AuthenticationInterceptor, добавляющий токены
      UserAgentInterceptor(),
    ]);
  }
}
