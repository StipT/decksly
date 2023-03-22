import "package:decksly/common/dev/logger.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_params.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/domain/deck_selection/usecase/fetch_deck_usecase.dart";
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

    on<ChangeDeckCodeEvent>((event, emit) async => handleChangeDeckCodeEvent(emit, event.deckCode));

    on<ChangeGameModeEvent>((event, emit) async => handleChangeGameModeEvent(emit, event.gameMode));

    on<SelectClassEvent>((event, emit) async => handleSelectClassEvent(emit, event.heroClass));
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
        emit(
          DeckSelectionState.deckImported(
            deck: deck,
          ),
        );
      },
    );
  }

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
}
