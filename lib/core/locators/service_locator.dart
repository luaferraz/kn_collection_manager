import 'package:get_it/get_it.dart';
import 'package:kayou_cards/app/auth/data/datasources/auth_datasource.dart';
import 'package:kayou_cards/core/locators/separated/auth_locators.dart';
import 'package:kayou_cards/core/locators/separated/http_locators.dart';

GetIt serviceLocator = GetIt.instance;

void setupLocator() async {
  setupHttpLocators();
  setupAuthLocators();
}
