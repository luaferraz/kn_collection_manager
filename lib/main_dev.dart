import 'package:flutter/material.dart';
import 'package:kayou_cards/app.dart';
import 'package:kayou_cards/core/app_config.dart';
import 'package:kayou_cards/core/locators/service_locator.dart';

void main() {
  AppConfig.setEnvironment(Environment.DEV);

  setupLocator();

  runApp(const AppWidget());
}
