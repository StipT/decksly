import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_page.freezed.dart';

@freezed
class CardsPage with _$CardsPage {
  const factory CardsPage({
    required List<CardDTO> cards,
    required int cardCount,
    required int pageCount,
    required int page,
  }) = _CardsPage;
}
