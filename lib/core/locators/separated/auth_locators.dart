import 'package:kayou_cards/app/data/datasources/auth_datasource.dart';
import 'package:kayou_cards/core/locators/service_locator.dart';

Future<void> setupAuthLocators() async {
  serviceLocator.registerSingleton<AuthDatasource>(AuthDatasource());
}
