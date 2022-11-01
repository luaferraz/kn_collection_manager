import 'package:flutter/material.dart';
import 'package:kayou_cards/core/routes/app_router.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';

void main() async {
  // AppConfig.setEnvironment(Environment.heroku);
  // WidgetsFlutterBinding.ensureInitialized();
  // String? sheetId = await SecureStorageHelper.read(key: StorageKeys.idSheets);

  // if (sheetId != null) {
  //   await SellerSheetsApi.init();
  // }

  // await setupLocators();

  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agente parceiro Magalu',
      // theme: AppThemes.theme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.dashboard,
    );
  }
}
