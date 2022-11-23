import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kayou_cards/core/app_config.dart';
import 'package:kayou_cards/core/sources/local_storage_source.dart';

class HttpService {
  final Dio _dio = Dio();

  HttpService() {
    _dio.options.baseUrl = AppConfig.baseUrl;
    _dio.options.connectTimeout = 5000; // 5s
    _dio.options.receiveTimeout = 5000; // 3s
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      print('send request：baseURL:${options.baseUrl} -- path:${options.path}');

      if (!kIsWeb) {
        (_dio.httpClientAdapter as DefaultHttpClientAdapter)
            .onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      return handler.next(options);
    }));
  }

  HttpService.withAuthentication() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.options.baseUrl = AppConfig.baseUrl;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      var storageToken =
          await LocalStorageSource.getString(LocalStorageKeys.access_token);

      options.headers['Authorization'] = 'Bearer $storageToken';

      print(
          'request done in：baseURL:${options.baseUrl} -- path:${options.path}');

      return handler.next(options);
    }, onError: (error, handler) async {
      print(error.message);

      return handler.next(error);
    }));
  }
  Dio get instance => _dio;
}
