import 'package:flutter/material.dart';
import 'package:kayou_cards/app/shared/themes/app_colors.dart';
import 'package:kayou_cards/app/shared/widgets/app_top_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWidget(
        title: "Home",
      ),
      body: Center(
        child: Text(
          "PAOLLA É UMA GATINHA <3 ",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
