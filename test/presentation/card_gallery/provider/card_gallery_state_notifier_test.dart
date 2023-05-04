import "package:connectivity_plus/connectivity_plus.dart";
import "package:dartz/dartz.dart";
import "package:decksly/common/util/exception_to_failure_mapper.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/domain/card_gallery/model/card_filter_params/card_filter_params.dart";
import "package:decksly/domain/card_gallery/model/card_filters/attack.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_class.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_set.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_type.dart";
import "package:decksly/domain/card_gallery/model/card_filters/health.dart";
import "package:decksly/domain/card_gallery/model/card_filters/keywords.dart";
import "package:decksly/domain/card_gallery/model/card_filters/locale.dart";
import "package:decksly/domain/card_gallery/model/card_filters/minion_type.dart";
import "package:decksly/domain/card_gallery/model/card_filters/rarity.dart";
import "package:decksly/domain/card_gallery/model/card_filters/sort_by.dart";
import "package:decksly/domain/card_gallery/model/card_filters/spell_school.dart";
import "package:decksly/domain/card_gallery/model/cards_page/cards_page.dart";
import "package:decksly/domain/card_gallery/usecase/fetch_cards_usecase.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state_notifier.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:state_notifier_test/state_notifier_test.dart";

class MockFetchCardsUsecase extends Mock implements FetchCardsUsecase {}

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Stream<ConnectivityResult> get resultStream =>
      Stream<ConnectivityResult>.fromIterable([ConnectivityResult.mobile, ConnectivityResult.wifi]);
}

void main() {
  group("CardGalleryStateNotifier", () {
    late CardGalleryNotifier cardGalleryNotifier;

    final fetchCardsUsecase = MockFetchCardsUsecase();
    final networkInfo = MockNetworkInfo();

    setUp(() {
      cardGalleryNotifier = CardGalleryNotifier(networkInfo, fetchCardsUsecase, CardGalleryNotifierInstanceType.cardGallery);
    });

    test("correct initialState", () {
      expect(
        cardGalleryNotifier.state,
         const CardGalleryState.initial(cardFilterParams: CardFilterParams(), page: CardsPage()),
      );
    });

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleFetchCards successfully",
      setUp: () {
        when(() => fetchCardsUsecase(const CardFilterParams(page: 1)))
            .thenAnswer((_) async => Future.value(const Right(CardsPage(page: 1, cards: []))));
      },
      build: () => cardGalleryNotifier,
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleFetchCards(const CardFilterParams());
      },
      expect: () =>
      [const CardGalleryState.fetched(page: CardsPage(page: 1), cardFilterParams: CardFilterParams(page: 1))],
      verify: (_) {
        verify(() => fetchCardsUsecase(const CardFilterParams(page: 1))).called(1);
      },
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleFetchCards failure",
      setUp: () {
        when(() => fetchCardsUsecase(const CardFilterParams(page: 1))).thenAnswer(
              (_) async =>
              Future.value(Left(ExceptionToFailureMapper.mapExceptionToFailure(Exception("Unknown exception")))),
        );
      },
      build: () => cardGalleryNotifier,
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleFetchCards(const CardFilterParams());
      },
      expect: () => [
        CardGalleryState.failure(
          cardFilterParams: const CardFilterParams(page: 1),
          failure: UnknownFailure(ExceptionToFailureMapper.unknownFailureMessage),
        )
      ],
      verify: (_) {
        verify(() => fetchCardsUsecase(const CardFilterParams(page: 1))).called(1);
      },
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleCardFilterParamsChanged",
      build: () => cardGalleryNotifier,
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(heroClass: [DeckClass.paladin.name]));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(set: CardSet.blackrockMountain.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(const CardFilterParams(manaCost: "10"));
        cardGalleryNotifier.handleCardFilterParamsChanged(const CardFilterParams(textFilter: "dragon"));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(sort: SortBy.manaAsc.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(attack: Attack.four.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(health: Health.four.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(type: CardType.minion.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(minionType: MinionType.murloc.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(spellSchool: SpellSchool.fire.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(rarity: Rarity.legendary.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(CardFilterParams(keyword: Keyword.charge.value));
        cardGalleryNotifier.handleCardFilterParamsChanged(const CardFilterParams(gameMode: "constructed"));
        cardGalleryNotifier.handleCardFilterParamsChanged(const CardFilterParams(locale: "ja_JP"));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin"])),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(set: "blackrock-mountain")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(manaCost: "10")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(textFilter: "dragon")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(sort: "manaCost:asc")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(attack: "4")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(health: "4")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(type: "minion")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(minionType: "murloc")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(spellSchool: "fire")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(rarity: "legendary")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(keyword: "charge")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(gameMode: "constructed")),
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(locale: "ja_JP")),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleLocaleChanged",
      build: () => cardGalleryNotifier,
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleLocaleChanged(CardFilterParams(locale: Locale.japanese.value));
        cardGalleryNotifier.handleLocaleChanged(CardFilterParams(locale: Locale.german.value));
        cardGalleryNotifier.handleLocaleChanged(CardFilterParams(locale: Locale.english.value));
      },
      expect: () => [
        const CardGalleryState.localeChanged(cardFilterParams: CardFilterParams(locale: "ja_JP")),
        const CardGalleryState.localeChanged(cardFilterParams: CardFilterParams(locale: "de_DE")),
        const CardGalleryState.localeChanged(cardFilterParams: CardFilterParams(locale: "en_US")),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleToggleClassCards while class is not selected but neutral is",
      build: () => cardGalleryNotifier,
      seed: () => [CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.neutral.value]),
      )],
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleToggleClassCards(DeckClass.paladin);
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["neutral", "paladin"], page: 0)),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleToggleClassCards while class is selected and so is neutral",
      build: () => cardGalleryNotifier,
      seed: () => [CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.paladin.value, CardClass.neutral.value]),
      )],
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleToggleClassCards(DeckClass.paladin);
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["neutral"], page: 0)),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleToggleClassCards while class is selected and neutral is not",
      build: () => cardGalleryNotifier,
      seed: () => [CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [DeckClass.paladin.name]),
      )],
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleToggleClassCards(DeckClass.paladin);
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["neutral"], page: 0)),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleToggleNeutralCards while class is not selected but neutral is",
      build: () => cardGalleryNotifier,
      seed: () => [CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.neutral.value]),
      )],
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleToggleNeutralCards(DeckClass.paladin);
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin"], page: 0)),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleToggleNeutralCards while class is selected and so is neutral",
      build: () => cardGalleryNotifier,
      seed: () => [CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.paladin.value, CardClass.neutral.value]),
      )],
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleToggleNeutralCards(DeckClass.paladin);
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin"], page: 0)),
      ],
    );

    stateNotifierTest<CardGalleryNotifier, CardGalleryState>(
      "handleToggleNeutralCards while class is selected and neutral is not",
      build: () => cardGalleryNotifier,
      seed: () => [CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [DeckClass.paladin.name]),
      )],
      actions: (cardGalleryNotifier) {
        cardGalleryNotifier.handleToggleNeutralCards(DeckClass.paladin);
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin", "neutral"], page: 0)),
      ],
    );

  });
}