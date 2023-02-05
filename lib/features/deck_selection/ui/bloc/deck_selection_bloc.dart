import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'deck_creator_bloc.freezed.dart';
part 'deck_selection_event.dart';
part 'deck_selection_state.dart';

@injectable
class DeckSelectionBloc extends Bloc<DeckSelectionEvent, DeckSelectionState> {
  DeckSelectionBloc(this._networkInfo)
      : super(const DeckSelectionState.initial(
          deckCode: "",
          deckType: DeckType.standard,
          deckClass: null,
          selectedDeckId: null,
        )) {
    on<ImportDeckEvent>((event, emit) => handleImportDeck(emit, event.deckCode));
    on<LoadCreatedDecksEvent>((event, emit) async => handleLoadCreatedDecks(emit));

    on<ChangeGameModeEvent>((event, emit) async => handleChangeGameModeEvent(emit, event.gameMode));
    on<SelectLoadedDeckEvent>((event, emit) async => handleSelectLoadedDeckEvent(emit, event.deckId));
    on<SelectClassEvent>((event, emit) async => handleSelectClassEvent(emit, event.heroClass));
    on<CloseEvent>((event, emit) async => handleClose(emit));
    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;

  // final LoadCreatedDecksUsecase fetchCardsUsecase;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  void handleClose(Emitter<DeckSelectionState> emit) {}

  void handleSelectLoadedDeckEvent(Emitter<DeckSelectionState> emit, String deckId) {}

  void handleChangeGameModeEvent(Emitter<DeckSelectionState> emit, DeckType deckType) {
    final updatedState = state.copyWith(deckType: deckType);
    emit(DeckSelectionState.changed(
      deckCode: updatedState.deckCode,
      deckType: updatedState.deckType,
      deckClass: updatedState.deckClass,
      selectedDeckId: updatedState.selectedDeckId,
    ));
  }

  void handleSelectClassEvent(Emitter<DeckSelectionState> emit, DeckClass deckClass) {
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

  void handleImportDeck(Emitter<DeckSelectionState> emit, String deckCode) {
    // fetchDeckUsecase();
  }
}
