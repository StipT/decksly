import "package:bloc_test/bloc_test.dart";
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
import "package:decksly/presentation/deck_builder/bloc/deck_builder_bloc.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

import "../../../mock_data/mock_data.dart";

class MockFetchDeckCodeUsecase extends Mock implements FetchDeckCodeUsecase {}

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Stream<ConnectivityResult> get resultStream =>
      Stream<ConnectivityResult>.fromIterable([ConnectivityResult.mobile, ConnectivityResult.wifi]);
}

void main() {
  group("DeckBuilderBloc", () {
    late DeckBuilderBloc deckBuilderBloc;

    final fetchDeckCodeUsecase = MockFetchDeckCodeUsecase();
    final networkInfo = MockNetworkInfo();

    setUp(() {
      deckBuilderBloc = DeckBuilderBloc(networkInfo, fetchDeckCodeUsecase);
    });

    test("correct initialState", () {
      expect(
        deckBuilderBloc.state,
        const DeckBuilderState.initial(deck: Deck()),
      );
    });

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleDeckChanged initial",
      build: () => deckBuilderBloc,
      seed: () => const DeckBuilderState.initial(deck: Deck()),
      act: (deckBuilderBloc) {
        deckBuilderBloc
            .add(DeckChangedEvent(Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList())));
      },
      expect: () => [
        DeckBuilderState.initial(
          deck: Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList()),
        )
      ],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleDeckChanged changed",
      build: () => deckBuilderBloc,
      seed: () => DeckBuilderState.changed(deck: Deck(cards: [getDeckCardList().first])),
      act: (deckBuilderBloc) {
        deckBuilderBloc
            .add(DeckChangedEvent(Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList())));
      },
      expect: () => [
        DeckBuilderState.changed(
          deck: Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: getDeckCardList()),
        )
      ],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleAddCard when the card is duplicate from the deck",
      build: () => deckBuilderBloc,
      seed: () => DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(AddCardEvent(getShieldSlamCard()));
      },
      expect: () {
        final List<CardDTO> expectedCards = [];
        expectedCards.addAll(getCardList());
        expectedCards.add(getShieldSlamCard());

        return [
          DeckBuilderState.changed(
            deck: Deck(cards: expectedCards.toDeckCards()),
          )
        ];
      },
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleAddCard when the card is unique to the deck",
      build: () => deckBuilderBloc,
      seed: () => DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(AddCardEvent(getGalakrondCard()));
      },
      expect: () {
        final List<CardDTO> expectedCards = [];
        expectedCards.addAll(getCardList());
        expectedCards.add(getGalakrondCard());

        return [
          DeckBuilderState.cardAdded(
            index: 8,
            deck: Deck(cards: expectedCards.toDeckCards()),
          )
        ];
      },
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleAddCard when card is duplicate legendary",
      build: () => deckBuilderBloc,
      seed: () {
        final List<CardDTO> seedCards = [];
        seedCards.addAll(getCardList());
        seedCards.add(getGalakrondCard());
        return DeckBuilderState.changed(deck: Deck(cards: seedCards.toDeckCards()));
      },
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(AddCardEvent(getGalakrondCard()));
      },
      expect: () => [],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleAddCard when deck already have maximum amount of cards",
      build: () => deckBuilderBloc,
      seed: () {
        final List<CardDTO> seedCards = [];
        seedCards.addAll(getCardList());
        seedCards.addAll(getCardList());
        seedCards.addAll(getCardList());
        return DeckBuilderState.changed(deck: Deck(cards: seedCards.toDeckCards()));
      },
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(AddCardEvent(getGalakrondCard()));
      },
      expect: () => [],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleRemoveCard when there are 2 instances of the same card",
      build: () => deckBuilderBloc,
      seed: () => DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(RemoveCardEvent(9, getBrawlCard()));
      },
      expect: () => [
        DeckBuilderState.changed(
          deck: Deck(cards: getCardListWithoutOneBrawl().toDeckCards()),
        )
      ],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleRemoveCard when that card is not a duplicate in a deck",
      build: () => deckBuilderBloc,
      seed: () => DeckBuilderState.changed(deck: Deck(cards: getDeckCardList())),
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(RemoveCardEvent(8, getShieldSlamCard()));
      },
      expect: () => [
        DeckBuilderState.cardRemoved(
          index: 8,
          deck: Deck(cards: getCardListWithoutShieldSlam().toDeckCards()),
        )
      ],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
      "handleRemoveCard when the card doesn't exist in the deck",
      build: () => deckBuilderBloc,
      seed: () => const DeckBuilderState.changed(deck: Deck(cards: [])),
      act: (deckBuilderBloc) {
        deckBuilderBloc.add(RemoveCardEvent(0, getGalakrondCard()));
      },
      expect: () => [],
    );

    blocTest<DeckBuilderBloc, DeckBuilderState>(
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
      seed: () => DeckBuilderState.changed(
        deck: Deck(
          cards: getDeckCardList(),
          type: DeckType.wild,
          code: "",
        ),
      ),
      build: () => deckBuilderBloc,
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(FetchDeckCodeEvent(Locale.english.value));
      },
      expect: () => [
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

    blocTest<DeckBuilderBloc, DeckBuilderState>(
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
      build: () => deckBuilderBloc,
      seed: () => const DeckBuilderState.changed(
        deck: Deck(
          cards: [],
          type: DeckType.wild,
        ),
      ),
      act: (cardGalleryBloc) {
        cardGalleryBloc.add(FetchDeckCodeEvent(Locale.english.value));
      },
      expect: () => [
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

    tearDown(() {
      deckBuilderBloc.close();
    });
  });
}
