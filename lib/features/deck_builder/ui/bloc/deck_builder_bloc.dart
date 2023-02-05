import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:decksly/features/deck_builder/domain/model/deck.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'deck_builder_bloc.freezed.dart';

part 'deck_builder_event.dart';

part 'deck_builder_state.dart';

@injectable
class DeckBuilderBloc extends Bloc<DeckBuilderEvent, DeckBuilderState> {
  DeckBuilderBloc(this._networkInfo, {required this.fetchCardsUsecase})
      : super(const DeckBuilderState.initial(deck: Deck())) {
    on<DeckChangedEvent>((event, emit) async => await handleDeckChanged(emit, event.deck));

    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;
  final FetchCardsUsecase fetchCardsUsecase;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  Future<void> handleDeckChanged(Emitter<DeckBuilderState> emit, Deck deck) async {
    final Deck changedDeck = state.deck.copyWith(classType: deck.classType, modeType: deck.modeType, cards: deck.cards);
    emit(DeckBuilderState.changed(deck: changedDeck));
  }
}
