import "package:decksly/common/util/failures.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "deck_builder_state.freezed.dart";

@freezed
class DeckBuilderState with _$DeckBuilderState {
  const factory DeckBuilderState.initial({required Deck deck}) = _DeckBuilderInitial;

  const factory DeckBuilderState.changed({required Deck deck}) = _DeckBuilderChanged;

  const factory DeckBuilderState.codeGenerated({required Deck deck}) = _DeckBuilderCodeGenerated;

  const factory DeckBuilderState.cardAdded({required int index, required Deck deck}) = _DeckBuilderCardAdded;

  const factory DeckBuilderState.cardRemoved({required int index, required Deck deck}) = _DeckBuilderCardRemoved;

  const factory DeckBuilderState.failure({required Deck deck, required Failure failure}) = _DeckBuilderError;
}
