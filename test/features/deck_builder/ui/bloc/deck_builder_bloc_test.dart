import "package:connectivity_plus/connectivity_plus.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/features/deck_builder/domain/model/deck.dart";
import "package:decksly/features/deck_builder/domain/usecase/fetch_deck_code_usecase.dart";
import "package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

class MockFetchDeckCodeUsecase extends Mock implements FetchDeckCodeUsecase {}

class MockNetworkInfo extends Mock implements NetworkInfo {
  @override
  Stream<ConnectivityResult> get resultStream =>
      Stream<ConnectivityResult>.fromIterable([ConnectivityResult.mobile, ConnectivityResult.wifi]);
}

void main() {
  group("DeckBuilderBloc", () {
    late DeckBuilderBloc deckBuilderBloc;

    final fetchDeckUsecase = MockFetchDeckCodeUsecase();
    final networkInfo = MockNetworkInfo();

    setUp(() {
      deckBuilderBloc = DeckBuilderBloc(networkInfo, fetchDeckUsecase);
    });

    test("correct initialState", () {
      expect(
        deckBuilderBloc.state,
        const DeckBuilderState.initial(deck: Deck()),
      );
    });

    tearDown(() {
      deckBuilderBloc.close();
    });
  });
}
