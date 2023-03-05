part of "deck_selection_bloc.dart";

@immutable
abstract class DeckSelectionEvent {
  const DeckSelectionEvent();
}

class LoadCreatedDecksEvent extends DeckSelectionEvent {}

class ImportDeckEvent extends DeckSelectionEvent {
  const ImportDeckEvent(this.locale);

  final String locale;
}

class ChangeGameModeEvent extends DeckSelectionEvent {
  const ChangeGameModeEvent(this.gameMode);

  final DeckType gameMode;
}

class ChangeDeckCodeEvent extends DeckSelectionEvent {
  const ChangeDeckCodeEvent(this.deckCode);

  final String deckCode;
}

class SelectLoadedDeckEvent extends DeckSelectionEvent {
  const SelectLoadedDeckEvent(this.deckId);

  final String deckId;
}

class SelectClassEvent extends DeckSelectionEvent {
  const SelectClassEvent(this.heroClass);

  final DeckClass heroClass;
}

class CloseEvent extends DeckSelectionEvent {
  const CloseEvent();
}
