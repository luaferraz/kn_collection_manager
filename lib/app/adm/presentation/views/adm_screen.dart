import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kayou_cards/app/shared/widgets/app_top_bar_widget.dart';

class AdmScreen extends StatefulWidget {
  const AdmScreen({super.key});

  @override
  State<AdmScreen> createState() => _AdmScreenState();
}

class _AdmScreenState extends State<AdmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWidget(),
      body: Column(
        children: [],
      ),
    );
  }
}
