import "package:decksly/common/util/failures.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "deck_selection_state.freezed.dart";

@freezed
class DeckSelectionState with _$DeckSelectionState {
  const factory DeckSelectionState.initial({required Deck deck}) = _DeckSelectionInitial;

  const factory DeckSelectionState.changed({required Deck deck}) = _DeckSelectionChanged;

  const factory DeckSelectionState.deckImported({required Deck deck}) = _DeckSelectionImported;

  const factory DeckSelectionState.failure({required Deck deck, required Failure failure}) = _DeckSelectionFailure;
}
