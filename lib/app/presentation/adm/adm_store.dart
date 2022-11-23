import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kayou_cards/app/data/datasources/card_datasource.dart';
import 'package:kayou_cards/app/data/models/card_model.dart';
import 'package:kayou_cards/core/locators/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'adm_store.g.dart';

class AdmStore = _AdmStore with _$AdmStore;

abstract class _AdmStore with Store {
  final _cardDatasource = serviceLocator<CardDatasource>();

  Future<String?> readSheets({required BuildContext context}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    PlatformFile file = result!.files.first;

    var bytes = File(file.path!).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    List<Map<String, dynamic>> mapList = [];

    for (var table in excel.tables.keys) {
      for (int i = 0; i < excel.tables[table]!.rows.length; i++) {
        var row = excel.tables[table]!.rows[i];
        Map<String, dynamic> map = {};
        for (int j = 0; j < row.length; j++) {
          var value = row[j]?.value;
          if (i > 0) {
            map["${excel.tables[table]!.rows[0][j]!.value}"] = "${value}";
          }
        }
        if (i > 0) {
          mapList.add(map);
        }
      }
    }

    List<CardModel> cards = mapList.map((e) => CardModel.fromJson(e)).toList();

    // var ret = await _cardDatasource.addCardList(cardModelList: sellers);

    // if (ret != null) return ret;
  }
}
