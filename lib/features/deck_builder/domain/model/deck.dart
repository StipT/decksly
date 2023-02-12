import 'package:decksly/features/deck_builder/domain/model/deck_card.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';

@freezed
class Deck with _$Deck {
  const factory Deck({
    @Default("") String name,
    @Default([]) List<DeckCard> cards,
    @Default(DeckType.standard) DeckType modeType,
    @Default(DeckClass.warrior) DeckClass classType,
  }) = _Deck;
}