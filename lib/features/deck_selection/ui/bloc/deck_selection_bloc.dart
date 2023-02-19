import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:decksly/features/deck_selection/domain/usecase/fetch_deck_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'deck_creator_bloc.freezed.dart';

part 'deck_selection_event.dart';

part 'deck_selection_state.dart';

@injectable
class DeckSelectionBloc extends Bloc<DeckSelectionEvent, DeckSelectionState> {
  DeckSelectionBloc(this.fetchDeckUsecase)
      : super(const DeckSelectionState.initial(
          deckCode: "",
          deckType: DeckType.standard,
          deckClass: null,
          selectedDeckId: null,
        )) {
    on<ImportDeckEvent>(
        (event, emit) => handleImportDeck(emit));

    on<LoadCreatedDecksEvent>(
        (event, emit) async => handleLoadCreatedDecks(emit));

    on<ChangeDeckCodeEvent>(
        (event, emit) async => handleChangeDeckCodeEvent(emit, event.deckCode));

    on<ChangeGameModeEvent>(
        (event, emit) async => handleChangeGameModeEvent(emit, event.gameMode));

    on<SelectLoadedDeckEvent>(
        (event, emit) async => handleSelectLoadedDeckEvent(emit, event.deckId));

    on<SelectClassEvent>(
        (event, emit) async => handleSelectClassEvent(emit, event.heroClass));

    on<CloseEvent>((event, emit) async => handleClose(emit));
  }

  final FetchDeckUsecase fetchDeckUsecase;

  Future<void> handleImportDeck(
      Emitter<DeckSelectionState> emit) async {
    final deckCode = state.deckCode;
    final resultOrFailure = await fetchDeckUsecase(deckCode);
    resultOrFailure.fold(
      (failure) {
        log(failure.message, level: Level.error);
        emit(DeckSelectionState.failure(
          failure: failure,
          deckCode: deckCode,
          deckClass: state.deckClass,
          deckType: state.deckType,
          selectedDeckId: state.selectedDeckId,
        ));
      },
      (deck) {
        log(deck.toString(), level: Level.warning);
        emit(DeckSelectionState.changed(
          deckCode: deckCode,
          deckClass: state.deckClass,
          deckType: state.deckType,
          selectedDeckId: state.selectedDeckId,
        ));
      },
    );
  }

  void handleClose(Emitter<DeckSelectionState> emit) {}

  void handleSelectLoadedDeckEvent(
      Emitter<DeckSelectionState> emit, String deckId) {}

  void handleChangeGameModeEvent(
      Emitter<DeckSelectionState> emit, DeckType deckType) {
    final updatedState = state.copyWith(deckType: deckType);
    emit(DeckSelectionState.changed(
      deckCode: updatedState.deckCode,
      deckType: updatedState.deckType,
      deckClass: updatedState.deckClass,
      selectedDeckId: updatedState.selectedDeckId,
    ));
  }

  handleChangeDeckCodeEvent(Emitter<DeckSelectionState> emit, String deckCode) {
    final updatedState = state.copyWith(deckCode: deckCode);
    emit(DeckSelectionState.changed(
      deckCode: updatedState.deckCode,
      deckType: updatedState.deckType,
      deckClass: updatedState.deckClass,
      selectedDeckId: updatedState.selectedDeckId,
    ));
  }

  void handleSelectClassEvent(
      Emitter<DeckSelectionState> emit, DeckClass deckClass) {
    final updatedState = state.copyWith(deckClass: deckClass);
    emit(DeckSelectionState.changed(
      deckCode: updatedState.deckCode,
      deckType: updatedState.deckType,
      deckClass: updatedState.deckClass,
      selectedDeckId: updatedState.selectedDeckId,
    ));
    //    navigateToDeckBuilder(state.deckType, state.deckClass);
  }
  void handleLoadCreatedDecks(Emitter<DeckSelectionState> emit) {}
}
