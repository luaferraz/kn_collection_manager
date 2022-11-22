import 'package:dio/dio.dart';
import 'package:kayou_cards/core/http/interceptor/auth_interceptor.dart';
import 'package:kayou_cards/core/locators/service_locator.dart';

Future<void> setupHttpLocators() async {
  serviceLocator.registerFactory<Dio>(
    () => Dio(),
  );
  serviceLocator.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(),
  );
}
