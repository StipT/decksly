import "package:decksly/common/dev/logger.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_params.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/domain/deck_selection/usecase/fetch_deck_usecase.dart";
import "package:decksly/presentation/deck_selection/provider/deck_selection_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:logger/logger.dart";

final deckSelectionNotifierProvider = StateNotifierProvider.autoDispose<DeckSelectionNotifier, DeckSelectionState>(
  (ref) => DeckSelectionNotifier(
    ref.watch(fetchDeckUsecaseProvider),
  ),
);

class DeckSelectionNotifier extends StateNotifier<DeckSelectionState> {
  DeckSelectionNotifier(this.fetchDeckUsecase) : super(const DeckSelectionState.initial(deck: Deck()));

  final FetchDeckUsecase fetchDeckUsecase;

  Future<void> handleImportDeck(String locale) async {
    final deckCode = state.deck.code;
    final resultOrFailure = await fetchDeckUsecase(DeckParams(code: deckCode, locale: locale));
    resultOrFailure.fold(
      (failure) {
        log(failure.message, level: Level.error);
        state = DeckSelectionState.failure(
          failure: failure,
          deck: state.deck,
        );
      },
      (deck) {
        state = DeckSelectionState.deckImported(
          deck: deck,
        );
      },
    );
  }

  void handleChangeGameModeEvent(DeckType type) {
    final deck = state.deck.copyWith(type: type);
    state = DeckSelectionState.changed(
      deck: deck,
    );
  }

  void handleChangeDeckCodeEvent(String code) {
    final deck = state.deck.copyWith(code: code);
    state = DeckSelectionState.changed(
      deck: deck,
    );
  }

  void handleSelectClassEvent(DeckClass deckClass) {
    final deck = state.deck.copyWith(heroClass: deckClass);
    state = DeckSelectionState.changed(deck: deck);
  }
}
