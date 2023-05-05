import "package:connectivity_plus/connectivity_plus.dart";
import "package:dartz/dartz.dart";
import "package:decksly/common/util/exception_to_failure_mapper.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/domain/card_gallery/model/card_filters/locale.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_params.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/domain/deck_builder/usecase/fetch_deck_code_usecase.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state_notifier.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:state_notifier_test/state_notifier_test.dart";

import "../../../mock_data/mock_data.dart";

class MockFetchDeckCodeUsecase extends Mock implements FetchDeckCodeUsecase {}

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Stream<ConnectivityResult> get resultStream =>
      Stream<ConnectivityResult>.fromIterable([ConnectivityResult.mobile, ConnectivityResult.wifi]);
}

void main() {
  group("deckBuilderNotifier", () {
    late DeckBuilderNotifier deckBuilderNotifier;

    final fetchDeckCodeUsecase = MockFetchDeckCodeUsecase();
    final networkInfo = MockNetworkInfo();

    setUp(() {
      deckBuilderNotifier = DeckBuilderNotifier(networkInfo, fetchDeckCodeUsecase);
    });

    test("correct initialState", () {
      expect(
        deckBuilderNotifier.state,
        const DeckBuilderState.initial(deck: Deck()),
      );
    });

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleDeckChanged initial",
      build: () => deckBuilderNotifier,
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier
            .handleDeckChanged(Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList()));
      },
      expect: () => [
        DeckBuilderState.changed(
          deck: Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList()),
        )
      ],
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleDeckChanged changed",
      build: () => deckBuilderNotifier,
      seed: () => [
        DeckBuilderState.changed(deck: Deck(cards: [getDeckCardList().first])),
      ],
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier
            .handleDeckChanged(Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList()));
      },
      expect: () => [
        DeckBuilderState.changed(deck: Deck(cards: [getDeckCardList().first])),
        DeckBuilderState.changed(
          deck: Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList()),
        )
      ],
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleAddCard when the card is duplicate from the deck",
      build: () => deckBuilderNotifier,
      seed: () => [
        DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
      ],
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleAddCard(getShieldSlamCard());
      },
      expect: () {
        final List<CardDTO> expectedCards = [];
        expectedCards.addAll(getCardList());
        expectedCards.add(getShieldSlamCard());

        return [
          DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
          DeckBuilderState.changed(
            deck: Deck(cards: expectedCards.toDeckCards()),
          )
        ];
      },
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleAddCard when the card is unique to the deck",
      build: () => deckBuilderNotifier,
      seed: () => [
        DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
      ],
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleAddCard(getGalakrondCard());
      },
      expect: () {
        final List<CardDTO> expectedCards = [];
        expectedCards.addAll(getCardList());
        expectedCards.add(getGalakrondCard());

        return [
          DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
          DeckBuilderState.cardAdded(
            index: 8,
            deck: Deck(cards: expectedCards.toDeckCards()),
          )
        ];
      },
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleAddCard when card is duplicate legendary",
      build: () => deckBuilderNotifier,
      seed: () {
        final List<CardDTO> seedCards = [];
        seedCards.addAll(getCardList());
        seedCards.add(getGalakrondCard());
        return [DeckBuilderState.changed(deck: Deck(cards: seedCards.toDeckCards()))];
      },
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleAddCard(getGalakrondCard());
      },
      expect: () {
        final List<CardDTO> seedCards = [];
        seedCards.addAll(getCardList());
        seedCards.add(getGalakrondCard());

        return [DeckBuilderState.changed(deck: Deck(cards: seedCards.toDeckCards()))];
      },
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleAddCard when deck already have maximum amount of cards",
      build: () => deckBuilderNotifier,
      seed: () {
        final List<CardDTO> seedCards = [];
        seedCards.addAll(getCardList());
        seedCards.addAll(getCardList());
        seedCards.addAll(getCardList());
        return [DeckBuilderState.changed(deck: Deck(cards: seedCards.toDeckCards()))];
      },
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleAddCard(getGalakrondCard());
      },
      expect: () {
        final List<CardDTO> seedCards = [];
        seedCards.addAll(getCardList());
        seedCards.addAll(getCardList());
        seedCards.addAll(getCardList());
        return [DeckBuilderState.changed(deck: Deck(cards: seedCards.toDeckCards()))];
      },
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleRemoveCard when there are 2 instances of the same card",
      build: () => deckBuilderNotifier,
      seed: () => [DeckBuilderState.changed(deck: Deck(cards: getDeckCardList()))],
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleRemoveCard(9, getBrawlCard());
      },
      expect: () => [
        DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
        DeckBuilderState.changed(
          deck: Deck(cards: getCardListWithoutOneBrawl().toDeckCards()),
        )
      ],
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleRemoveCard when that card is not a duplicate in a deck",
      build: () => deckBuilderNotifier,
      seed: () => [DeckBuilderState.changed(deck: Deck(cards: getDeckCardList()))],
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleRemoveCard(8, getShieldSlamCard());
      },
      expect: () => [
        DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
        DeckBuilderState.cardRemoved(
          index: 8,
          deck: Deck(cards: getCardListWithoutShieldSlam().toDeckCards()),
        )
      ],
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleRemoveCard when the card doesn't exist in the deck",
      build: () => deckBuilderNotifier,
      seed: () => [const DeckBuilderState.changed(deck: Deck(cards: []))],
      actions: (deckBuilderNotifier) {
        deckBuilderNotifier.handleRemoveCard(0, getGalakrondCard());
      },
      expect: () => [const DeckBuilderState.changed(deck: Deck(cards: []))],
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleFetchDeckCode successfully",
      setUp: () {
        when(
          () => fetchDeckCodeUsecase(
            DeckParams(
              ids: "546,47133,1659,1023,75,75,49184,51739,48146,52954",
              locale: Locale.english.value,
              deckType: DeckType.wild.value,
            ),
          ),
        ).thenAnswer((_) async => Future.value(const Right("deckCode123")));
      },
      seed: () => [
        DeckBuilderState.changed(
          deck: Deck(
            cards: getDeckCardList(),
            type: DeckType.wild,
            code: "",
          ),
        ),
      ],
      build: () => deckBuilderNotifier,
      actions: (cardGalleryBloc) {
        cardGalleryBloc.handleFetchDeckCode(Locale.english.value);
      },
      expect: () => [
        DeckBuilderState.changed(
          deck: Deck(
            cards: getDeckCardList(),
            type: DeckType.wild,
            code: "",
          ),
        ),
        DeckBuilderState.codeGenerated(
          deck: Deck(
            code: "deckCode123",
            cards: getDeckCardList(),
            type: DeckType.wild,
          ),
        )
      ],
      verify: (_) {
        verify(
          () => fetchDeckCodeUsecase(
            DeckParams(
              ids: "546,47133,1659,1023,75,75,49184,51739,48146,52954",
              locale: Locale.english.value,
              deckType: DeckType.wild.value,
            ),
          ),
        ).called(1);
      },
    );

    stateNotifierTest<DeckBuilderNotifier, DeckBuilderState>(
      "handleFetchDeckCode failure",
      setUp: () {
        when(
          () => fetchDeckCodeUsecase(
            DeckParams(
              locale: Locale.english.value,
              deckType: DeckType.wild.value,
            ),
          ),
        ).thenAnswer(
          (_) async =>
              Future.value(Left(ExceptionToFailureMapper.mapExceptionToFailure(Exception("Unknown exception")))),
        );
      },
      build: () => deckBuilderNotifier,
      seed: () => [
        const DeckBuilderState.changed(
          deck: Deck(
            cards: [],
            type: DeckType.wild,
          ),
        ),
      ],
      actions: (cardGalleryBloc) {
        cardGalleryBloc.handleFetchDeckCode(Locale.english.value);
      },
      expect: () => [
        const DeckBuilderState.changed(
          deck: Deck(
            cards: [],
            type: DeckType.wild,
          ),
        ),
        DeckBuilderState.failure(
          failure: UnknownFailure(ExceptionToFailureMapper.unknownFailureMessage),
          deck: const Deck(
            cards: [],
            type: DeckType.wild,
          ),
        )
      ],
      verify: (_) {
        verify(
          () => fetchDeckCodeUsecase(
            DeckParams(
              locale: Locale.english.value,
              deckType: DeckType.wild.value,
            ),
          ),
        ).called(1);
      },
    );
  });
}
