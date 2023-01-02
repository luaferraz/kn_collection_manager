import 'package:kayou_cards/app/data/datasources/card_datasource.dart';
import 'package:kayou_cards/app/data/models/card_model.dart';
import 'package:kayou_cards/core/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  final _cardDatasource = serviceLocator<CardDatasource>();

  ObservableList<CardModel> cardList = ObservableList<CardModel>();

  @action
  _setCardList(List<CardModel> value) {
    cardList.clear();
    cardList.addAll(value);
  }

  Future<bool> loadCardList() async {
    try {
      List<CardModel> cards = await _cardDatasource.getCardList();

      _setCardList(cards);

      return true;
    } catch (err) {
      throw false;
    }
  }
}
