import "package:bloc_test/bloc_test.dart";
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
import "package:decksly/presentation/card_gallery/bloc/card_gallery_bloc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

class MockFetchCardsUsecase extends Mock implements FetchCardsUsecase {}

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Stream<ConnectivityResult> get resultStream =>
      Stream<ConnectivityResult>.fromIterable([ConnectivityResult.mobile, ConnectivityResult.wifi]);
}

void main() {
  group("CardGalleryBloc", () {
    late CardGalleryBloc cardGalleryBloc;

    final fetchCardsUsecase = MockFetchCardsUsecase();
    final networkInfo = MockNetworkInfo();

    setUp(() {
      cardGalleryBloc = CardGalleryBloc(networkInfo, fetchCardsUsecase);
    });

    test("correct initialState", () {
      expect(
        cardGalleryBloc.state,
        const CardGalleryState.initial(cardFilterParams: CardFilterParams(), page: CardsPage()),
      );
    });

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleFetchCards successfully",
      setUp: () {
        when(() => fetchCardsUsecase(const CardFilterParams(page: 1)))
            .thenAnswer((_) async => Future.value(const Right(CardsPage(page: 1, cards: []))));
      },
      build: () => cardGalleryBloc,
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const FetchCardsEvent(CardFilterParams()));
      },
      expect: () =>
          [const CardGalleryState.fetched(page: CardsPage(page: 1), cardFilterParams: CardFilterParams(page: 1))],
      verify: (_) {
        verify(() => fetchCardsUsecase(const CardFilterParams(page: 1))).called(1);
      },
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleFetchCards failure",
      setUp: () {
        when(() => fetchCardsUsecase(const CardFilterParams(page: 1))).thenAnswer(
          (_) async =>
              Future.value(Left(ExceptionToFailureMapper.mapExceptionToFailure(Exception("Unknown exception")))),
        );
      },
      build: () => cardGalleryBloc,
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const FetchCardsEvent(CardFilterParams()));
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

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleCardFilterParamsChanged",
      build: () => cardGalleryBloc,
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(heroClass: [DeckClass.paladin.name])));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(set: CardSet.blackrockMountain.value)));
        cardGalleryBloc.add(const CardFilterParamsChangedEvent(CardFilterParams(manaCost: "10")));
        cardGalleryBloc.add(const CardFilterParamsChangedEvent(CardFilterParams(textFilter: "dragon")));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(sort: SortBy.manaAsc.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(attack: Attack.four.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(health: Health.four.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(type: CardType.minion.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(minionType: MinionType.murloc.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(spellSchool: SpellSchool.fire.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(rarity: Rarity.legendary.value)));
        cardGalleryBloc.add(CardFilterParamsChangedEvent(CardFilterParams(keyword: Keyword.charge.value)));
        cardGalleryBloc.add(const CardFilterParamsChangedEvent(CardFilterParams(gameMode: "constructed")));
        cardGalleryBloc.add(const CardFilterParamsChangedEvent(CardFilterParams(locale: "ja_JP")));
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

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleLocaleChanged",
      build: () => cardGalleryBloc,
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(LocaleChangedEvent(CardFilterParams(locale: Locale.japanese.value)));
        cardGalleryBloc.add(LocaleChangedEvent(CardFilterParams(locale: Locale.german.value)));
        cardGalleryBloc.add(LocaleChangedEvent(CardFilterParams(locale: Locale.english.value)));
      },
      expect: () => [
        const CardGalleryState.localeChanged(cardFilterParams: CardFilterParams(locale: "ja_JP")),
        const CardGalleryState.localeChanged(cardFilterParams: CardFilterParams(locale: "de_DE")),
        const CardGalleryState.localeChanged(cardFilterParams: CardFilterParams(locale: "en_US")),
      ],
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleToggleClassCards while class is not selected but neutral is",
      build: () => cardGalleryBloc,
      seed: () => CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.neutral.value]),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const ToggleClassCardsEvent(DeckClass.paladin));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["neutral", "paladin"], page: 0)),
      ],
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleToggleClassCards while class is selected and so is neutral",
      build: () => cardGalleryBloc,
      seed: () => CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.paladin.value, CardClass.neutral.value]),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const ToggleClassCardsEvent(DeckClass.paladin));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["neutral"], page: 0)),
      ],
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleToggleClassCards while class is selected and neutral is not",
      build: () => cardGalleryBloc,
      seed: () => CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [DeckClass.paladin.name]),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const ToggleClassCardsEvent(DeckClass.paladin));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["neutral"], page: 0)),
      ],
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleToggleNeutralCards while class is not selected but neutral is",
      build: () => cardGalleryBloc,
      seed: () => CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.neutral.value]),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const ToggleNeutralCardsEvent(DeckClass.paladin));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin"], page: 0)),
      ],
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleToggleNeutralCards while class is selected and so is neutral",
      build: () => cardGalleryBloc,
      seed: () => CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [CardClass.paladin.value, CardClass.neutral.value]),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const ToggleNeutralCardsEvent(DeckClass.paladin));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin"], page: 0)),
      ],
    );

    blocTest<CardGalleryBloc, CardGalleryState>(
      "handleToggleNeutralCards while class is selected and neutral is not",
      build: () => cardGalleryBloc,
      seed: () => CardGalleryState.fetched(
        page: const CardsPage(),
        cardFilterParams: CardFilterParams(heroClass: [DeckClass.paladin.name]),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(const ToggleNeutralCardsEvent(DeckClass.paladin));
      },
      expect: () => [
        const CardGalleryState.fetching(cardFilterParams: CardFilterParams(heroClass: ["paladin", "neutral"], page: 0)),
      ],
    );

    tearDown(() {
      cardGalleryBloc.close();
    });
  });
}
