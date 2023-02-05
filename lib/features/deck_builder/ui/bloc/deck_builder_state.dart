part of 'deck_builder_bloc.dart';

@Freezed()
class DeckBuilderState with _$DeckBuilderState {
  const factory DeckBuilderState.initial({required Deck deck}) = _DeckBuilderInitial;
  const factory DeckBuilderState.changed({required Deck deck}) = _DeckBuilderChanged;
  const factory DeckBuilderState.failure({required Deck deck, required Failure failure}) = _DeckBuilderError;
}
