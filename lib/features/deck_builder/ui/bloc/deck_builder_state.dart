part of "deck_builder_bloc.dart";

@freezed
class DeckBuilderState with _$DeckBuilderState {
  const factory DeckBuilderState.initial({required Deck deck}) = _DeckBuilderInitial;

  const factory DeckBuilderState.changed({required Deck deck}) = _DeckBuilderChanged;

  const factory DeckBuilderState.codeGenerated({required Deck deck}) = _DeckBuilderCodeGenerated;

  const factory DeckBuilderState.cardAdded({required int index, required Deck deck}) = _DeckBuilderCardAdded;

  const factory DeckBuilderState.cardRemoved({required int index, required Deck deck}) = _DeckBuilderCardRemoved;

  const factory DeckBuilderState.failure({required Deck deck, required Failure failure}) = _DeckBuilderError;
}
