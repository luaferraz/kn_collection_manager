import 'package:flutter/material.dart';
import 'package:kayou_cards/app/shared/widgets/app_top_bar_widget.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWidget(),
      body: Center(),
    );
  }
}