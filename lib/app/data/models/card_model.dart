class CardModel {
  String imgUrl;
  String characterName;
  String rarity;
  String number;
  String tierWave;

  CardModel({
    this.imgUrl = "",
    this.characterName = "",
    this.rarity = "",
    this.number = "",
    this.tierWave = "",
  });

  static CardModel fromJson(Map<String, dynamic> json) {
    final obj = CardModel(
      imgUrl: json['imgUrl'] ?? "",
      characterName: json['characterName'] ?? "",
      rarity: json['rarity'] ?? "",
      number: json['number'] ?? "",
      tierWave: json['tierWave'] ?? "",
    );

    return obj;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    data['characterName'] = characterName;
    data['rarity'] = rarity;
    data['number'] = number;
    data['tierWave'] = tierWave;
    return data;
  }

  static List<CardModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => fromJson(i)).toList();
}
