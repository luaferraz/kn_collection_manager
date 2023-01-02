import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kayou_cards/app/data/datasources/card_datasource.dart';
import 'package:kayou_cards/app/data/models/card_model.dart';
import 'package:kayou_cards/core/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'adm_store.g.dart';

class AdmStore = _AdmStore with _$AdmStore;

abstract class _AdmStore with Store {
  final _cardDatasource = serviceLocator<CardDatasource>();

  Future<String?> readSheets({required BuildContext context}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      return "";
    }

    PlatformFile file = result.files.first;

    var bytes = File(file.path!).readAsBytesSync();
    print("antes do excel");
    var excel = Excel.decodeBytes(bytes);
    print("depois do excel");

    List<Map<String, dynamic>> mapList = [];

    for (var table in excel.tables.keys) {
      for (int i = 0; i < excel.tables[table]!.rows.length; i++) {
        var row = excel.tables[table]!.rows[i];
        print(excel.tables[table]!.sheetName);

        Map<String, dynamic> map = {};

        for (int j = 0; j < row.length; j++) {
          if (row[j] != null) {
            if (row[j]!.value != null) {
              var value = row[j]!.value;
              if (i > 0) {
                map["${excel.tables[table]!.rows[0][j]!.value}"] = "${value}";
              }
            }
          }
        }
        if (i > 0) {
          mapList.add(map);
        }
      }
    }

    List<CardModel> cards = mapList.map((e) => CardModel.fromJson(e)).toList();

    for (CardModel card in cards) {
      card.number = card.number.split(".")[0];
      print(card.number);
      // print(card.characterName);
      // print(card.imgUrl);
      // await _cardDatasource.icludeCardList(cardModel: card);
    }
    await _cardDatasource.icludeCardList(cardModel: cards);
  }
}
