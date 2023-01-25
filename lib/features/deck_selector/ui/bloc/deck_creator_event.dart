part of 'deck_creator_bloc.dart';

@immutable
abstract class DeckCreatorEvent {
  const DeckCreatorEvent();
}

class LoadCreatedDecksEvent extends DeckCreatorEvent {}

class ImportDeckEvent extends DeckCreatorEvent {
  final String deckCode;
  const ImportDeckEvent(this.deckCode);
}

class ChangeGameModeEvent extends DeckCreatorEvent {
  final ModeBadgeType gameMode;
  const ChangeGameModeEvent(this.gameMode);
}

class SelectLoadedDeckEvent extends DeckCreatorEvent {
  final String deckId;
  const SelectLoadedDeckEvent(this.deckId);
}

class SelectClassEvent extends DeckCreatorEvent {
  final ClassBadgeType heroClass;
  const SelectClassEvent(this.heroClass);
}

class CloseEvent extends DeckCreatorEvent {
  const CloseEvent();
}
