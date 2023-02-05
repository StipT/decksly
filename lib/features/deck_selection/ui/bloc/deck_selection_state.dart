part of 'deck_selection_bloc.dart';

@Freezed()
class DeckSelectionState with _$DeckCreatorState {
  const factory DeckSelectionState.initial({required String deckCode, required DeckType deckType, required DeckClass? deckClass, required String? selectedDeckId,}) = _DeckCreatorInitial;
  const factory DeckSelectionState.changed({required String deckCode, required DeckType deckType, required DeckClass? deckClass, required String? selectedDeckId,}) = _DeckCreatorChanged;
  const factory DeckSelectionState.failure({required String deckCode, required DeckType deckType, required DeckClass? deckClass, required String? selectedDeckId, required Failure failure,}) = _DeckCreatorFailure;
}
