part of 'deck_builder_bloc.dart';

@immutable
abstract class DeckBuilderEvent {
  const DeckBuilderEvent();
}

class InitialDeckPopulationEvent extends DeckBuilderEvent {
  final Deck deck;

  const InitialDeckPopulationEvent(this.deck);
}

class AddCardEvent extends DeckBuilderEvent {
  final CardDTO card;

  const AddCardEvent(this.card);
}

class RemoveCardEvent extends DeckBuilderEvent {
  final int index;
  final CardDTO card;

  const RemoveCardEvent(this.index, this.card);
}

class DeckChangedEvent extends DeckBuilderEvent {
  final Deck deck;

  const DeckChangedEvent(this.deck);
}

class FetchDeckCodeEvent extends DeckBuilderEvent {
  final String locale;

  const FetchDeckCodeEvent(this.locale);
}
