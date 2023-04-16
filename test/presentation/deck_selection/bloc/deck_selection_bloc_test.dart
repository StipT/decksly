import "package:bloc_test/bloc_test.dart";
import "package:dartz/dartz.dart";
import "package:decksly/common/util/exception_to_failure_mapper.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/domain/card_gallery/model/card_filters/locale.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_params.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/domain/deck_selection/usecase/fetch_deck_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

class MockFetchDeckUsecase extends Mock implements FetchDeckUsecase {}

void main() {
  /*
  group("DeckSelectionBloc", () {
    late DeckSelectionBloc deckSelectionBloc;

    final fetchDeckUsecase = MockFetchDeckUsecase();

    setUp(() {
      deckSelectionBloc = DeckSelectionBloc(fetchDeckUsecase);
    });

    test("correct initialState", () {
      expect(
        deckSelectionBloc.state,
        const DeckSelectionState.initial(deck: Deck()),
      );
    });

    blocTest<DeckSelectionBloc, DeckSelectionState>(
      "handleImportDeck successfully",
      setUp: () {
        when(() => fetchDeckUsecase(DeckParams(code: "deckCode123", locale: Locale.english.value))).thenAnswer(
          (_) async => Future.value(const Right(Deck(type: DeckType.wild, heroClass: DeckClass.paladin, cards: []))),
        );
      },
      build: () => deckSelectionBloc,
      seed: () => const DeckSelectionState.changed(deck: Deck(code: "deckCode123")),
      act: (deckSelectionBloc) {
        deckSelectionBloc.add(ImportDeckEvent(Locale.english.value));
      },
      expect: () => [
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

    blocTest<DeckSelectionBloc, DeckSelectionState>(
      "handleImportDeck failure",
      setUp: () {
        when(() => fetchDeckUsecase(DeckParams(code: "deckCode123", locale: Locale.english.value))).thenAnswer(
          (_) async =>
              Future.value(Left(ExceptionToFailureMapper.mapExceptionToFailure(Exception("Unknown exception")))),
        );
      },
      build: () => deckSelectionBloc,
      seed: () => const DeckSelectionState.changed(deck: Deck(code: "deckCode123")),
      act: (deckSelectionBloc) {
        deckSelectionBloc.add(ImportDeckEvent(Locale.english.value));
      },
      expect: () => [
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

    blocTest<DeckSelectionBloc, DeckSelectionState>(
      "handleChangeGameModeEvent",
      build: () => deckSelectionBloc,
      act: (deckSelectionBloc) {
        deckSelectionBloc.add(const ChangeGameModeEvent(DeckType.wild));
        deckSelectionBloc.add(const ChangeGameModeEvent(DeckType.classic));
        deckSelectionBloc.add(const ChangeGameModeEvent(DeckType.standard));
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(type: DeckType.wild)),
        const DeckSelectionState.changed(deck: Deck(type: DeckType.classic)),
        const DeckSelectionState.changed(deck: Deck(type: DeckType.standard)),
      ],
    );

    blocTest<DeckSelectionBloc, DeckSelectionState>(
      "handleChangeDeckCodeEvent",
      build: () => deckSelectionBloc,
      act: (deckSelectionBloc) {
        deckSelectionBloc.add(const ChangeDeckCodeEvent("deckCode"));
        deckSelectionBloc.add(const ChangeDeckCodeEvent("deckCode123"));
        deckSelectionBloc.add(const ChangeDeckCodeEvent("deckCode123 456"));
        deckSelectionBloc.add(const ChangeDeckCodeEvent(""));
        deckSelectionBloc.add(const ChangeDeckCodeEvent("123"));
      },
      expect: () => [
        const DeckSelectionState.changed(deck: Deck(code: "deckCode")),
        const DeckSelectionState.changed(deck: Deck(code: "deckCode123")),
        const DeckSelectionState.changed(deck: Deck(code: "deckCode123 456")),
        const DeckSelectionState.changed(deck: Deck(code: "")),
        const DeckSelectionState.changed(deck: Deck(code: "123")),
      ],
    );

    blocTest<DeckSelectionBloc, DeckSelectionState>(
      "handleSelectClassEvent",
      build: () => deckSelectionBloc,
      act: (deckSelectionBloc) {
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.deathknight));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.demonhunter));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.druid));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.hunter));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.mage));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.paladin));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.priest));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.rogue));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.shaman));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.warlock));
        deckSelectionBloc.add(const SelectClassEvent(DeckClass.warrior));
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

    tearDown(() {
      deckSelectionBloc.close();
    });
  });
   */
}
