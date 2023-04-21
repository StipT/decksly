import "package:connectivity_plus/connectivity_plus.dart";
import "package:decksly/common/dev/logger.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/domain/card_gallery/model/card_filter_params/card_filter_params.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_class.dart";
import "package:decksly/domain/card_gallery/model/cards_page/cards_page.dart";
import "package:decksly/domain/card_gallery/usecase/fetch_cards_usecase.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:logger/logger.dart";
import "package:rxdart/rxdart.dart";

enum CardGalleryNotifierInstanceType {
  cardGallery,
  deckBuilder,
}

final cardGalleryNotifierProvider =
    StateNotifierProvider.autoDispose.family<CardGalleryNotifier, CardGalleryState, CardGalleryNotifierInstanceType>(
  (ref, screenType) => CardGalleryNotifier(
    ref.watch(networkInfoProvider),
    ref.watch(fetchCardsUsecaseProvider),
    screenType,
  ),
);

class CardGalleryNotifier extends StateNotifier<CardGalleryState> {
  CardGalleryNotifier(this._networkInfo, this.fetchCardsUsecase, this.notifierInstanceType)
      : super(const CardGalleryState.initial(cardFilterParams: CardFilterParams(), page: CardsPage())) {
    _streamInternetConnectionState();
  }

  final CardGalleryNotifierInstanceType notifierInstanceType;
  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;

  final FetchCardsUsecase fetchCardsUsecase;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  Future<void> handleFetchCards(CardFilterParams cardFilterParams) async {
    final updatedParams = cardFilterParams.copyWith(page: cardFilterParams.page! + 1);
    final resultOrFailure = await fetchCardsUsecase(updatedParams);

    resultOrFailure.fold(
      (failure) {
        log(failure.message, level: Level.error);
        state = CardGalleryState.failure(failure: failure, cardFilterParams: updatedParams);
      },
      (cards) {
        state = CardGalleryState.fetched(cardFilterParams: updatedParams, page: cards);
      },
    );
  }

  Future<void> handleCardFilterParamsChanged(CardFilterParams cardFilterParams) async {
    state = CardGalleryState.fetching(cardFilterParams: cardFilterParams.copyWith(page: 0));
  }

  Future<void> handleLocaleChanged(CardFilterParams cardFilterParams) async {
    state = CardGalleryState.localeChanged(cardFilterParams: cardFilterParams.copyWith(page: 0));
  }

  Future<void> handleToggleClassCards(DeckClass deckClass) async {
    final List<String> classes = [];
    classes.addAll(state.cardFilterParams.heroClass);
    if (classes.contains(deckClass.name) && classes.length == 1) {
      classes.remove(deckClass.name);
      classes.add(CardClass.neutral.value);
    } else if (classes.contains(deckClass.name) && classes.length > 1) {
      classes.remove(deckClass.name);
    } else {
      classes.add(deckClass.name);
    }
    state = CardGalleryState.fetching(cardFilterParams: state.cardFilterParams.copyWith(heroClass: classes, page: 0));
  }

  Future<void> handleToggleNeutralCards(DeckClass deckClass) async {
    final List<String> classes = [];
    classes.addAll(state.cardFilterParams.heroClass);
    if (classes.contains(CardClass.neutral.value) && classes.length == 1) {
      classes.remove(CardClass.neutral.value);
      classes.add(deckClass.name);
    } else if (classes.contains(CardClass.neutral.value) && classes.length > 1) {
      classes.remove(CardClass.neutral.value);
    } else {
      classes.add(CardClass.neutral.value);
    }
    state = CardGalleryState.fetching(cardFilterParams: state.cardFilterParams.copyWith(heroClass: classes, page: 0));
  }
}
