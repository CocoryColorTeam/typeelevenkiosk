import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';



String getBaseUrl() {
  if (kIsWeb) {
    // ✅ Spring static에서 서비스될 경우
    return '';
    // → same-origin (https://cocory.shop)
  }

  if (defaultTargetPlatform == TargetPlatform.android) {
    return 'https://cocory.shop';
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    return 'https://cocory.shop';
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    return 'https://cocory.shop';
  } else {
    return 'https://cocory.shop';
  }
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
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print('[DIO REQUEST] ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('[DIO RESPONSE] ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (e, handler) {
        print('[DIO ERROR] ${e.message}');
        return handler.next(e);
      },
    ),
  );
}

