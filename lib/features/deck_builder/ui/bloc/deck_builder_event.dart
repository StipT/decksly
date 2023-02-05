part of 'deck_builder_bloc.dart';

@immutable
abstract class DeckBuilderEvent {
   const DeckBuilderEvent();
}

class AddCardEvent extends DeckBuilderEvent {
  final CardDTO card;
  const AddCardEvent(this.card);
}

class RemoveCardEvent extends DeckBuilderEvent {
  final CardDTO card;
  const RemoveCardEvent(this.card);
}

class DeckChangedEvent extends DeckBuilderEvent {
  final Deck deck;
  const DeckChangedEvent(this.deck);
}