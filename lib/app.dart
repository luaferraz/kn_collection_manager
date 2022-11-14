import 'package:flutter/material.dart';
import 'package:kayou_cards/app/shared/themes/app_theme.dart';
import 'package:kayou_cards/core/routes/app_router.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

String theme = '';

ThemeMode themeBrightness = ThemeMode.dark;

class _AppWidgetState extends State<AppWidget> {
  // final AppSettingsStore _appSettingsStore = AppSettingsStore();

  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  asyncInit() async {
    // await _appSettingsStore.loadTheme();
    setState(() {
      // themeBrightness = _appSettingsStore.themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppWidget.themeNotifier.value = themeBrightness;
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppWidget.themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Moon Cards',
          // darkTheme: AppThemes.darkTheme,
          // theme: AppThemes.lightTheme,
          theme: AppThemes.darkTheme,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.dashboard,
        );
      },
    );
  }
}
