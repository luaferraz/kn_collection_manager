import 'package:kayou_cards/core/locators/service_locator.dart';

Future<void> setupAuthLocators() async {
  serviceLocator.registerLazySingleton<IAuthDatasource>(
    () => AuthDatasource(),
  );
  serviceLocator.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(serviceLocator<IAuthDatasource>()),
  );
  serviceLocator.registerLazySingleton<IAuthUseCase>(
    () => AuthUseCase(serviceLocator<IAuthRepository>()),
  );
  serviceLocator.registerLazySingleton<LoginStore>(
    () => LoginStore(),
  );
  serviceLocator.registerLazySingleton<ForgotPassWordStore>(
    () => ForgotPassWordStore(),
  );
  serviceLocator.registerLazySingleton<SignUpStore>(
    () => SignUpStore(),
  );
  
}serviceLocator.registerSingleton<AuthDatasource>(AuthDatasource());