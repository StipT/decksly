part of 'deck_selection_bloc.dart';

@immutable
abstract class DeckSelectionEvent {
  const DeckSelectionEvent();
}

class LoadCreatedDecksEvent extends DeckSelectionEvent {}

class ImportDeckEvent extends DeckSelectionEvent {
  final String deckCode;
  const ImportDeckEvent(this.deckCode);
}

class ChangeGameModeEvent extends DeckSelectionEvent {
  final DeckType gameMode;
  const ChangeGameModeEvent(this.gameMode);
}

class SelectLoadedDeckEvent extends DeckSelectionEvent {
  final String deckId;
  const SelectLoadedDeckEvent(this.deckId);
}

class SelectClassEvent extends DeckSelectionEvent {
  final DeckClass heroClass;
  const SelectClassEvent(this.heroClass);
}

class CloseEvent extends DeckSelectionEvent {
  const CloseEvent();
}
