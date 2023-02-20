import 'package:decksly/features/deck_builder/domain/model/deck_card.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';

@freezed
class Deck with _$Deck {
  const factory Deck({
    @Default("") String name,
    @Default("") String code,
    @Default([]) List<DeckCard> cards,
    @Default(DeckType.standard) DeckType type,
    @Default(DeckClass.warrior) DeckClass heroClass,
  }) = _Deck;
}

extension CardDTOListParse on List<CardDTO> {
  List<DeckCard> toDeckCards() {
    final deckCardList = map((value) {
      return DeckCard(
          card: value,
          amount: where((element) => element == value).length);
    })
        .toSet()
        .toList();

    deckCardList.sort((deckCard1, deckCard2) {
      if (deckCard1.card.manaCost == deckCard2.card.manaCost) {
        return deckCard1.card.name.compareTo(deckCard2.card.name);
      } else {
        return deckCard1.card.manaCost.compareTo(deckCard2.card.manaCost);
      }
    });

    return deckCardList;
  }
}
