import 'package:decksly/repository/remote_source/api/dto/card_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_response.g.dart';
part 'cards_response.freezed.dart';

@freezed
class CardsResponse with _$CardsResponse {
  const factory CardsResponse({
    required List<CardDTO> cards,
    required int cardCount,
    required int pageCount,
    required int page,
  }) = _CardsResponse;

  factory CardsResponse.fromJson(Map<String, dynamic> json) =>
      _$CardsResponseFromJson(json);
}
