import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kayou_cards/app/data/datasources/auth_datasource.dart';
import 'package:kayou_cards/app/data/datasources/card_datasource.dart';
import 'package:kayou_cards/core/http/interceptor/auth_interceptor.dart';

GetIt serviceLocator = GetIt.instance;

void setupLocator() async {
  serviceLocator.registerSingleton<AuthDatasource>(AuthDatasource());
  serviceLocator.registerSingleton<CardDatasource>(CardDatasource());
  serviceLocator.registerFactory<Dio>(
    () => Dio(),
  );
  serviceLocator.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(),
  );
}
