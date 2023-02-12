import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:decksly/features/deck_builder/domain/model/deck.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_card.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
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
    on<DeckChangedEvent>((event, emit) => handleDeckChanged(emit, event.deck));
    on<AddCardEvent>((event, emit) => handleAddCard(emit, event.card));
    on<RemoveCardEvent>((event, emit) => handleRemoveCard(emit, event.card));
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

  void handleDeckChanged(Emitter<DeckBuilderState> emit, Deck deck) {
    final Deck changedDeck = state.deck.copyWith(name: deck.name, classType: deck.classType, modeType: deck.modeType, cards: deck.cards);
    emit(DeckBuilderState.changed(deck: changedDeck));
  }

  void handleAddCard(Emitter<DeckBuilderState> emit, CardDTO card) {
    List<DeckCard> cards = [];
    cards.addAll(state.deck.cards);

    final duplicateCardOrNull = cards.firstWhereOrNull((element) => element.card == card);

    if (cards.isNotEmpty && cards.map((e) => e.amount).reduce((value, element) => value += element) >= 30) {
      return;
    }

    if (duplicateCardOrNull != null && card.rarityId == 5) {
      return;
    }

    if (duplicateCardOrNull != null && duplicateCardOrNull.amount > 1) {
      return;
    }

    if (cards.where((element) => element.card == card).length == 1) {
      cards.removeWhere((element) => element.card == card);
      cards.add(DeckCard(card: card, amount: 2));
    } else {
      cards.add(DeckCard(card: card, amount: 1));
    }

    cards.sort((deckCard1, deckCard2) {
      if (deckCard1.card.manaCost == deckCard2.card.manaCost) {
        return deckCard1.card.name.compareTo(deckCard2.card.name);
      } else {
        return deckCard1.card.manaCost.compareTo(deckCard2.card.manaCost);
      }
    });

    emit(DeckBuilderState.changed(deck: state.deck.copyWith(cards: cards)));
  }

  void handleRemoveCard(Emitter<DeckBuilderState> emit, CardDTO card) {
    List<DeckCard> cards = [];
    cards.addAll(state.deck.cards);

    final duplicateCardOrNull = cards.firstWhereOrNull((element) => element.card == card);

    if (duplicateCardOrNull == null) {
      return;
    }

    if (cards.where((element) => (element.card == card) && (element.amount == 2)).isNotEmpty) {
      cards.removeWhere((element) => element.card == card);
      cards.add(DeckCard(card: card, amount: 1));
    } else {
      cards.removeWhere((element) => element.card == card);
    }

    cards.sort((deckCard1, deckCard2) {
      if (deckCard1.card.manaCost == deckCard2.card.manaCost) {
        return deckCard1.card.name.compareTo(deckCard2.card.name);
      } else {
        return deckCard1.card.manaCost.compareTo(deckCard2.card.manaCost);
      }
    });

    emit(DeckBuilderState.changed(deck: state.deck.copyWith(cards: cards)));
  }
}
