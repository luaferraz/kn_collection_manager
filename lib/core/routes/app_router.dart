import 'package:flutter/material.dart';
import 'package:kayou_cards/app/adm/presentation/views/adm_screen.dart';
import 'package:kayou_cards/app/auth/presentation/views/login_screen.dart';
import 'package:kayou_cards/app/dashboard/presentation/view/dashboard_screen.dart';
import 'package:kayou_cards/app/home/presentation/views/home_screen.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.adm:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AdmScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("Nenhuma rota definida para ${settings.name}"),
            ),
          ),
        );
    }
  }
}
