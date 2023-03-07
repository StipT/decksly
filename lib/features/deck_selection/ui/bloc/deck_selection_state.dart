part of "deck_selection_bloc.dart";

@freezed
class DeckSelectionState with _$DeckSelectionState {
  const factory DeckSelectionState.initial({required Deck deck}) = _DeckSelectionInitial;

  const factory DeckSelectionState.changed({required Deck deck}) = _DeckSelectionChanged;

  const factory DeckSelectionState.deckImported({required Deck deck}) = _DeckSelectionImported;

  const factory DeckSelectionState.failure({required Deck deck, required Failure failure}) = _DeckSelectionFailure;
}
