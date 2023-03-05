import "package:decksly/common/dev/logger.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/features/deck_builder/domain/model/deck.dart";
import "package:decksly/features/deck_builder/domain/model/deck_class.dart";
import "package:decksly/features/deck_builder/domain/model/deck_params.dart";
import "package:decksly/features/deck_builder/domain/model/deck_type.dart";
import "package:decksly/features/deck_selection/domain/usecase/fetch_deck_usecase.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";
import "package:logger/logger.dart";

part "deck_selection_bloc.freezed.dart";

part "deck_selection_event.dart";

part "deck_selection_state.dart";

@injectable
class DeckSelectionBloc extends Bloc<DeckSelectionEvent, DeckSelectionState> {
  DeckSelectionBloc(this.fetchDeckUsecase) : super(const DeckSelectionState.initial(deck: Deck())) {
    on<ImportDeckEvent>((event, emit) => handleImportDeck(emit, event.locale));

    on<LoadCreatedDecksEvent>((event, emit) async => handleLoadCreatedDecks(emit));

    on<ChangeDeckCodeEvent>((event, emit) async => handleChangeDeckCodeEvent(emit, event.deckCode));

    on<ChangeGameModeEvent>((event, emit) async => handleChangeGameModeEvent(emit, event.gameMode));

    on<SelectLoadedDeckEvent>((event, emit) async => handleSelectLoadedDeckEvent(emit, event.deckId));

    on<SelectClassEvent>((event, emit) async => handleSelectClassEvent(emit, event.heroClass));

    on<CloseEvent>((event, emit) async => handleClose(emit));
  }

  final FetchDeckUsecase fetchDeckUsecase;

  Future<void> handleImportDeck(Emitter<DeckSelectionState> emit, String locale) async {
    final deckCode = state.deck.code;
    final resultOrFailure = await fetchDeckUsecase(DeckParams(code: deckCode, locale: locale));
    resultOrFailure.fold(
      (failure) {
        log(failure.message, level: Level.error);
        emit(
          DeckSelectionState.failure(
            failure: failure,
            deck: state.deck,
          ),
        );
      },
      (deck) {
        log(deck.toString(), level: Level.warning);
        emit(
          DeckSelectionState.deckImported(
            deck: deck,
          ),
        );
      },
    );
  }

  void handleClose(Emitter<DeckSelectionState> emit) {}

  void handleSelectLoadedDeckEvent(Emitter<DeckSelectionState> emit, String deckId) {}

  void handleChangeGameModeEvent(Emitter<DeckSelectionState> emit, DeckType type) {
    final deck = state.deck.copyWith(type: type);
    emit(
      DeckSelectionState.changed(
        deck: deck,
      ),
    );
  }

  void handleChangeDeckCodeEvent(Emitter<DeckSelectionState> emit, String code) {
    final deck = state.deck.copyWith(code: code);
    emit(
      DeckSelectionState.changed(
        deck: deck,
      ),
    );
  }

  void handleSelectClassEvent(Emitter<DeckSelectionState> emit, DeckClass deckClass) {
    final deck = state.deck.copyWith(heroClass: deckClass);
    emit(DeckSelectionState.changed(deck: deck));
  }

  void handleLoadCreatedDecks(Emitter<DeckSelectionState> emit) {}
}
