import 'package:get_it/get_it.dart';
import 'package:kayou_cards/app/auth/data/datasources/auth_datasource.dart';

GetIt serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerSingleton<AuthDatasource>(AuthDatasource());
}
