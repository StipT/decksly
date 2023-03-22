part of "deck_builder_bloc.dart";

@immutable
abstract class DeckBuilderEvent {
  const DeckBuilderEvent();
}

class AddCardEvent extends DeckBuilderEvent {
  const AddCardEvent(this.card);

  final CardDTO card;
}

class RemoveCardEvent extends DeckBuilderEvent {
  const RemoveCardEvent(this.index, this.card);

  final int index;
  final CardDTO card;
}

class DeckChangedEvent extends DeckBuilderEvent {
  const DeckChangedEvent(this.deck);

  final Deck deck;
}

class FetchDeckCodeEvent extends DeckBuilderEvent {
  const FetchDeckCodeEvent(this.locale);

  final String locale;
}
