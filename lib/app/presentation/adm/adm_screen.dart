import 'package:flutter/material.dart';
import 'package:kayou_cards/app/presentation/adm/adm_store.dart';
import 'package:kayou_cards/app/shared/widgets/app_button_text.dart';
import 'package:kayou_cards/app/shared/widgets/app_top_bar_widget.dart';

class AdmScreen extends StatefulWidget {
  const AdmScreen({super.key});

  @override
  State<AdmScreen> createState() => _AdmScreenState();
}

class _AdmScreenState extends State<AdmScreen> {
  final AdmStore _admStore = AdmStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWidget(),
      body: Column(
        children: [
          Text("data"),
          Center(
            child: AppFilledButton(
              text: "Importar",
              onPressed: () async {
                await _admStore.readSheets(context: context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
