import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:decksly/features/deck_selector/ui/screen/widgets/hs_class_badge.dart';
import 'package:decksly/features/deck_selector/ui/screen/widgets/hs_mode_badge.dart';
import 'package:decksly/features/deck_selector/ui/screen/widgets/hs_mode_badge.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'deck_creator_event.dart';
part 'deck_creator_state.dart';

@injectable
class DeckCreatorBloc extends Bloc<DeckCreatorEvent, DeckCreatorState> {
  DeckCreatorBloc(this._networkInfo) : super(const DeckCreatorInitial()) {
    on<ImportDeckEvent>((event, emit) => handleImportDeck(emit, event.deckCode));
    on<LoadCreatedDecksEvent>((event, emit) async => await handleLoadCreatedDecks(emit));

    on<ChangeGameModeEvent>((event, emit) async => await handleChangeGameModeEvent(emit, event.gameMode));
    on<SelectLoadedDeckEvent>((event, emit) async => await handleSelectLoadedDeckEvent(emit, event.deckId));
    on<SelectClassEvent>((event, emit) async => await handleSelectClassEvent(emit, event.heroClass));
    on<CloseEvent>((event, emit) async => await handleClose(emit));
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


  handleClose(Emitter<DeckCreatorState> emit) {}

  handleSelectLoadedDeckEvent(Emitter<DeckCreatorState> emit, String deckId) {}

  handleChangeGameModeEvent(Emitter<DeckCreatorState> emit, ModeBadgeType gameMode) {
    emit(DeckCreatorChanged(state.deckCode, gameMode, state.heroClass, state.selectedDeckId));
  }

  handleSelectClassEvent(Emitter<DeckCreatorState> emit, ClassBadgeType heroClass) {
    emit(DeckCreatorChanged(state.deckCode, state.gameMode, heroClass, state.selectedDeckId));
    // navigateToDeckBuilder(state.gameMode, state.heroClass);
  }

  handleLoadCreatedDecks(Emitter<DeckCreatorState> emit) {}

  handleImportDeck(Emitter<DeckCreatorState> emit, String deckCode) {
    emit(DeckCreatorChanged(deckCode, state.gameMode, state.heroClass, state.selectedDeckId));
    // fetchDeckUsecase();
  }


}
