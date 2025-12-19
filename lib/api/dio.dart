import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

String getBaseUrl() {
  return 'https://cocoryapp.shop';
}
final dio = Dio(
  BaseOptions(
    baseUrl: getBaseUrl(),
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ),
);

// ✅ 요청 / 응답 / 에러 로그 찍기
void initDio() {
  dio.options.baseUrl = getBaseUrl();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print('[DIO REQUEST] ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('[DIO RESPONSE] ${response.statusCode}');
        return handler.next(response);
      },
      onError: (e, handler) {
        print('[DIO ERROR] ${e.message}');
        return handler.next(e);
      },
    ),
  );
}

