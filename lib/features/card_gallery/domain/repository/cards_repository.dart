import "package:decksly/common/util/exceptions.dart";
import "package:decksly/common/util/network_info.dart";
import "package:decksly/features/card_gallery/domain/model/cards_page/cards_page.dart";
import "package:decksly/repository/remote_source/api/api_service.dart";
import "package:injectable/injectable.dart";

abstract class CardsRepository {
  Future<CardsPage> getCards({
    num? pageSize,
    num? page,
    String? locale,
    String? set,
    String? heroClass,
    String? manaCost,
    String? attack,
    String? health,
    String? collectible,
    String? rarity,
    String? type,
    String? minionType,
    String? keyword,
    String? textFilter,
    String? gameMode,
    String? spellSchool,
    String? sort,
  });
}

@LazySingleton(as: CardsRepository)
class CardsRepositoryImpl extends CardsRepository {
  CardsRepositoryImpl(
    this._apiService,
    this._networkInfo,
  );

  final ApiService _apiService;
  final NetworkInfo _networkInfo;

  @override
  Future<CardsPage> getCards({
    num? pageSize,
    num? page,
    String? locale,
    String? set,
    String? heroClass,
    String? manaCost,
    String? attack,
    String? health,
    String? collectible,
    String? rarity,
    String? type,
    String? minionType,
    String? keyword,
    String? textFilter,
    String? gameMode,
    String? spellSchool,
    String? sort,
  }) async {
    if (!await _networkInfo.isConnected) {
      throw NoInternetException();
    }

    final cardResponse = await _apiService.apiClient.getCards(
      pageSize: pageSize,
      gameMode: gameMode,
      collectible: collectible,
      page: page,
      locale: locale,
      set: set,
      heroClass: heroClass,
      manaCost: manaCost,
      textFilter: textFilter,
      sort: sort,
      attack: attack,
      health: health,
      type: type,
      minionType: minionType,
      spellSchool: spellSchool,
      rarity: rarity,
      keyword: keyword,
    );
    return CardsPage(
      cards: cardResponse.cards,
      cardCount: cardResponse.cardCount,
      pageCount: cardResponse.pageCount,
      page: cardResponse.page,
    );
  }
}
