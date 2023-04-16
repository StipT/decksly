import "package:collection/collection.dart";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:decksly/common/dev/logger.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_card.dart";
import "package:decksly/domain/deck_builder/model/deck_params.dart";
import "package:decksly/domain/deck_builder/usecase/fetch_deck_code_usecase.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:logger/logger.dart";
import "package:rxdart/rxdart.dart";

final deckBuilderNotifierProvider = StateNotifierProvider.autoDispose<DeckBuilderNotifier, DeckBuilderState>(
  (ref) => DeckBuilderNotifier(
    ref.watch(networkInfoProvider),
    ref.watch(fetchDeckCodeUsecaseProvider),
  ),
);

class DeckBuilderNotifier extends StateNotifier<DeckBuilderState> {
  DeckBuilderNotifier(this._networkInfo, this.fetchDeckCodeUsecase)
      : super(const DeckBuilderState.initial(deck: Deck())) {
    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;

  final FetchDeckCodeUsecase fetchDeckCodeUsecase;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  void handleDeckChanged(Deck deck) {
    final Deck changedDeck = state.deck.copyWith(heroClass: deck.heroClass, type: deck.type, cards: deck.cards);

    state.deck.cards.isEmpty
        ? state = DeckBuilderState.initial(deck: changedDeck)
        : state = DeckBuilderState.changed(deck: changedDeck);
  }

  void handleAddCard(CardDTO card) {
    final List<DeckCard> cards = [];
    cards.addAll(state.deck.cards);

    final duplicateCardOrNull = cards.firstWhereOrNull((element) => element.card == card);

    if (cards.isNotEmpty && cards.map((e) => e.amount).reduce((value, element) => value += element) >= 30) {
      return;
    }

    if (duplicateCardOrNull != null && card.rarityId == 5) {
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

    final index = cards.indexWhere((element) => element.card == card);

    cards[index].amount == 2
        ? state = DeckBuilderState.changed(deck: state.deck.copyWith(cards: cards))
        : state = DeckBuilderState.cardAdded(index: index, deck: state.deck.copyWith(cards: cards));
  }

  void handleRemoveCard(int index, CardDTO card) {
    final List<DeckCard> cards = [];
    cards.addAll(state.deck.cards);

    final duplicateCardOrNull = cards.firstWhereOrNull((element) => element.card == card);

    if (duplicateCardOrNull == null) {
      return;
    }

    bool cardRemoved = false;

    if (cards.where((element) => (element.card == card) && (element.amount == 2)).isNotEmpty) {
      cards.removeWhere((element) => element.card == card);
      cards.add(DeckCard(card: card, amount: 1));
    } else {
      cardRemoved = true;
      cards.removeWhere((element) => element.card == card);
    }

    cards.sort((deckCard1, deckCard2) {
      if (deckCard1.card.manaCost == deckCard2.card.manaCost) {
        return deckCard1.card.name.compareTo(deckCard2.card.name);
      } else {
        return deckCard1.card.manaCost.compareTo(deckCard2.card.manaCost);
      }
    });

    cardRemoved
        ? state = DeckBuilderState.cardRemoved(index: index, deck: state.deck.copyWith(cards: cards))
        : state = DeckBuilderState.changed(deck: state.deck.copyWith(cards: cards));
  }

  Future<void> handleFetchDeckCode(String locale) async {
    final ids = state.deck.cards.map((e) => e.amount == 2 ? "${e.card.id},${e.card.id}" : "${e.card.id}").join(",");
    final resultOrFailure =
        await fetchDeckCodeUsecase(DeckParams(ids: ids, locale: locale, deckType: state.deck.type.name));
    resultOrFailure.fold(
      (failure) {
        log(failure.message, level: Level.error);
        state = DeckBuilderState.failure(failure: failure, deck: state.deck);
      },
      (deckCode) {
        state = DeckBuilderState.codeGenerated(deck: state.deck.copyWith(code: deckCode));
      },
    );
  }
}
