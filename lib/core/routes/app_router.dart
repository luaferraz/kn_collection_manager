import 'package:flutter/material.dart';
import 'package:kayou_cards/app/dashboard/view/dashboard_screen.dart';
import 'package:kayou_cards/app/home/presentation/view/home_screen.dart';
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
