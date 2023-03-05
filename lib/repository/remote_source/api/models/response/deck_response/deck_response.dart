import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:decksly/repository/remote_source/api/dto/class_dto/class_dto.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "deck_response.freezed.dart";

part "deck_response.g.dart";

@freezed
class DeckResponse with _$DeckResponse {
  const factory DeckResponse({
    required String deckCode,
    required int? version,
    required CardDTO? hero,
    required CardDTO? heroPower,
    required List<CardDTO> cards,
    required int? cardCount,
    @JsonKey(name: "class") required ClassDTO? deckClass,
    @JsonKey(name: "format") required String deckType,
  }) = _DeckResponse;

  factory DeckResponse.fromJson(Map<String, dynamic> json) => _$DeckResponseFromJson(json);
}
