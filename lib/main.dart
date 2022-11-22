import 'package:flutter/material.dart';
import 'package:kayou_cards/core/routes/app_router.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';
import 'package:kayou_cards/app/shared/themes/app_theme.dart';
import 'package:kayou_cards/core/locators/service_locator.dart';

void main() async {
  // AppConfig.setEnvironment(Environment.heroku);
  // WidgetsFlutterBinding.ensureInitialized();
  // String? sheetId = await SecureStorageHelper.read(key: StorageKeys.idSheets);

  // if (sheetId != null) {
  //   await SellerSheetsApi.init();
  // }

  setupLocator();

  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kayou',
      theme: AppThemes.darkTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.dashboard,
    );
  }
}
