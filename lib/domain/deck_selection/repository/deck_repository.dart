import "package:decksly/common/util/exceptions.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/repository/remote_source/api/api_service.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final deckRepositoryProvider = Provider<DeckRepository>(
  (ref) => DeckRepositoryImpl(
    ref.watch(apiServiceProvider),
    ref.watch(networkInfoProvider),
  ),
);

abstract class DeckRepository {
  Future<Deck> getDeck(String? deckCode, String locale);

  Future<String> getDeckCode(String? idList, String locale, String deckType);
}

class DeckRepositoryImpl extends DeckRepository {
  DeckRepositoryImpl(
    this._apiService,
    this._networkInfo,
  );

  final ApiService _apiService;
  final NetworkInfo _networkInfo;

  @override
  Future<Deck> getDeck(String? deckCode, String locale) async {
    if (!await _networkInfo.isConnected) {
      throw NoInternetException();
    }

    final deckResponse = await _apiService.apiClient.getDeck(deckCode, locale);
    return Deck(
      cards: deckResponse.cards.toDeckCards(),
      heroClass: deckClassFromValue(deckResponse.deckClass?.slug),
      type: deckTypeFromValue(deckResponse.deckType),
    );
  }

  @override
  Future<String> getDeckCode(String? idList, String locale, String deckType) async {
    if (!await _networkInfo.isConnected) {
      throw NoInternetException();
    }

    final deckCodeResponse = await _apiService.apiClient.getDeckCode(idList, locale, deckType);
    return deckCodeResponse.deckCode;
  }
}
