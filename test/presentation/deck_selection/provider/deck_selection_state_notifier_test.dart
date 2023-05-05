import "package:dartz/dartz.dart";
import "package:decksly/common/util/exception_to_failure_mapper.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/domain/card_gallery/model/card_filters/locale.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_params.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/domain/deck_selection/usecase/fetch_deck_usecase.dart";
import "package:decksly/presentation/deck_selection/provider/deck_selection_state.dart";
import "package:decksly/presentation/deck_selection/provider/deck_selection_state_notifier.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:state_notifier_test/state_notifier_test.dart";

class MockFetchDeckUsecase extends Mock implements FetchDeckUsecase {}

void main() {
  group("deckSelectionNotifier", () {
    late DeckSelectionNotifier deckSelectionNotifier;

    final fetchDeckUsecase = MockFetchDeckUsecase();

    setUp(() {
      deckSelectionNotifier = DeckSelectionNotifier(fetchDeckUsecase);
    });

    test("correct initialState", () {
      expect(
        deckSelectionNotifier.state,
        const DeckSelectionState.initial(deck: Deck()),
      );
    });

    stateNotifierTest<DeckSelectionNotifier, DeckSelectionState>(
      "handleImportDeck successfully",
      setUp: () {
        when(() => fetchDeckUsecase(DeckParams(code: "deckCode123", locale: Locale.english.value))).thenAnswer(
          (_) async => Future.value(const Right(Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: []))),
        );
      },
      build: () => deckSelectionNotifier,
      seed: () => [const DeckSelectionState.changed(deck: Deck(code: "deckCode123"))],
      actions: (deckSelectionNotifier) {
        deckSelectionNotifier.handleImportDeck(Locale.english.value);
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(code: "deckCode123")),
        const DeckSelectionState.deckImported(
          deck: Deck(
            type: DeckType.wild,
            heroClass: DeckClass.paladin,
            cards: [],
          ),
        )
      ],
      verify: (_) {
        verify(() => fetchDeckUsecase(DeckParams(code: "deckCode123", locale: Locale.english.value))).called(1);
      },
    );

    stateNotifierTest<DeckSelectionNotifier, DeckSelectionState>(
      "handleImportDeck failure",
      setUp: () {
        when(() => fetchDeckUsecase(DeckParams(code: "deckCode123", locale: Locale.english.value))).thenAnswer(
          (_) async =>
              Future.value(Left(ExceptionToFailureMapper.mapExceptionToFailure(Exception("Unknown exception")))),
        );
      },
      build: () => deckSelectionNotifier,
      seed: () => [const DeckSelectionState.changed(deck: Deck(code: "deckCode123"))],
      actions: (deckSelectionNotifier) {
        deckSelectionNotifier.handleImportDeck(Locale.english.value);
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(code: "deckCode123")),
        DeckSelectionState.failure(
          failure: UnknownFailure(ExceptionToFailureMapper.unknownFailureMessage),
          deck: const Deck(
            code: "deckCode123",
          ),
        )
      ],
      verify: (_) {
        verify(() => fetchDeckUsecase(DeckParams(code: "deckCode123", locale: Locale.english.value))).called(1);
      },
    );

    stateNotifierTest<DeckSelectionNotifier, DeckSelectionState>(
      "handleChangeGameModeEvent",
      build: () => deckSelectionNotifier,
      actions: (deckSelectionNotifier) {
        deckSelectionNotifier.handleChangeGameModeEvent(DeckType.wild);
        deckSelectionNotifier.handleChangeGameModeEvent(DeckType.classic);
        deckSelectionNotifier.handleChangeGameModeEvent(DeckType.standard);
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(type: DeckType.wild)),
        const DeckSelectionState.changed(deck: Deck(type: DeckType.classic)),
        const DeckSelectionState.changed(deck: Deck(type: DeckType.standard)),
      ],
    );

    stateNotifierTest<DeckSelectionNotifier, DeckSelectionState>(
      "handleChangeDeckCodeEvent",
      build: () => deckSelectionNotifier,
      actions: (deckSelectionNotifier) {
        deckSelectionNotifier.handleChangeDeckCodeEvent("deckCode");
        deckSelectionNotifier.handleChangeDeckCodeEvent("deckCode123");
        deckSelectionNotifier.handleChangeDeckCodeEvent("deckCode123 456");
        deckSelectionNotifier.handleChangeDeckCodeEvent("");
        deckSelectionNotifier.handleChangeDeckCodeEvent("123");
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(code: "deckCode")),
        const DeckSelectionState.changed(deck: Deck(code: "deckCode123")),
        const DeckSelectionState.changed(deck: Deck(code: "deckCode123 456")),
        const DeckSelectionState.changed(deck: Deck(code: "")),
        const DeckSelectionState.changed(deck: Deck(code: "123")),
      ],
    );

    stateNotifierTest<DeckSelectionNotifier, DeckSelectionState>(
      "handleSelectClassEvent",
      build: () => deckSelectionNotifier,
      actions: (deckSelectionNotifier) {
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.deathknight);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.demonhunter);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.druid);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.hunter);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.mage);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.paladin);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.priest);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.rogue);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.shaman);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.warlock);
        deckSelectionNotifier.handleSelectClassEvent(DeckClass.warrior);
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.deathknight)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.demonhunter)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.druid)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.hunter)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.mage)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.paladin)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.priest)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.rogue)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.shaman)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.warlock)),
        const DeckSelectionState.changed(deck: Deck(heroClass: DeckClass.warrior)),
      ],
    );
  });
}
