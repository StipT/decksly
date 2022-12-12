import 'package:decksly/repository/remote_source/dto/card_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cards_response.g.dart';

@JsonSerializable()
class CardsResponse {
  CardsResponse({
    required this.cards,
    required this.cardCount,
    required this.pageCount,
    required this.page,
  });

  factory CardsResponse.fromJson(Map<String, dynamic> json) =>
      _$CardsResponseFromJson(json);

  final List<CardDTO> cards;
  final int cardCount;
  final int pageCount;
  final int page;

  Map<String, dynamic> toJson() => _$CardsResponseToJson(this);
}
