import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_card.freezed.dart';

@freezed
class DeckCard with _$DeckCard {
  const factory DeckCard({
    required CardDTO card,
    @Default(1) int amount,
  }) = _DeckCard;
}
