import 'dart:convert';

import 'package:kayou_cards/app/data/models/card_model.dart';
import 'package:kayou_cards/core/http/http_service.dart';
import 'package:kayou_cards/core/http/interceptor/auth_interceptor.dart';
import 'package:kayou_cards/core/service_locator.dart';
import 'package:kayou_cards/core/sources/api_source.dart';
import 'package:mobx/mobx.dart';

part 'card_datasource.g.dart';

class CardDatasource = _CardDatasourceBase with _$CardDatasource;

abstract class _CardDatasourceBase with Store {
  late HttpService _httpWithAuth;

  CardDatasource() {
    _httpWithAuth = HttpService(
      interceptors: [
        serviceLocator<AuthInterceptor>(),
      ],
    );
  }

  Future icludeCard({CardModel? cardModel}) async {
    try {
      _httpWithAuth = HttpService(
        interceptors: [
          serviceLocator<AuthInterceptor>(),
        ],
      );

      if (cardModel == null) {
        return;
      }

      final response = await _httpWithAuth.post(
        ApiSource().icludeCard,
        data: cardModel.toJson(),
      );

      print(response);
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future icludeCardList({List<CardModel>? cardModel}) async {
    try {
      _httpWithAuth = HttpService(
        interceptors: [
          serviceLocator<AuthInterceptor>(),
        ],
      );

      if (cardModel == null) {
        return;
      }

      final response = await _httpWithAuth.post(
        ApiSource().icludeCardList,
        data: jsonEncode(cardModel),
      );

      print(response);
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<List<CardModel>> getCardList() async {
    try {
      _httpWithAuth = HttpService(
        interceptors: [
          serviceLocator<AuthInterceptor>(),
        ],
      );

      final response = await HttpService().get(
        ApiSource().listCards,
      );

      return CardModel.fromJsonList(response);
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
