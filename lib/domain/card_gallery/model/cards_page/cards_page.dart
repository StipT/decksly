import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cards_page.freezed.dart";

@freezed
class CardsPage with _$CardsPage {
  const factory CardsPage({
    @Default([]) List<CardDTO>? cards,
    @Default(0) int? cardCount,
    @Default(0) int? pageCount,
    @Default(0) int? page,
  }) = _CardsPage;
}
