import 'package:decksly/repository/remote_source/dto/card_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_response.g.dart';

@JsonSerializable()
class CardResponse {
  CardResponse({
    required this.cards,
    required this.cardCount,
    required this.pageCount,
    required this.page,
  });

  factory CardResponse.fromJson(Map<String, dynamic> json) =>
      _$CardResponseFromJson(json);

  final List<CardDTO> cards;
  final int cardCount;
  final int pageCount;
  final int page;


  Map<String, dynamic> toJson() => _$CardResponseToJson(this);
}
