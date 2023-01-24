part of 'deck_creator_bloc.dart';

@immutable
abstract class DeckCreatorState extends Equatable {
  const DeckCreatorState(this.deckCode, this.gameMode, this.heroClass, this.selectedDeckId);

  final String deckCode;
  final ModeBadgeType gameMode;
  final ClassBadgeType? heroClass;
  final String? selectedDeckId;

  @override
  List<Object?> get props => [deckCode, gameMode, heroClass, selectedDeckId];
}

class DeckCreatorInitial extends DeckCreatorState {
  const DeckCreatorInitial() : super("", ModeBadgeType.standard, null, null);
}

class DeckCreatorChanged extends DeckCreatorState {
  const DeckCreatorChanged(
    super.deckCode,
    super.gameMode,
    super.heroClass,
    super.selectedDeckId,
  );
}

class DeckCreatorError extends DeckCreatorState {
  const DeckCreatorError(
    this.failure,
    super.deckCode,
    super.gameMode,
    super.heroClass,
    super.selectedDeckId,
  );

  final Failure failure;
}
