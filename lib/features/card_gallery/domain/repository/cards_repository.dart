import 'package:decksly/common/exceptions.dart';
import 'package:decksly/common/network_info.dart';
import 'package:decksly/repository/remote_source/api/api_service.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:injectable/injectable.dart';

abstract class CardsRepository {
  Future<List<CardDTO>> getCards({
    num page,
    String locale = "en_US",
    String? set,
    String? heroClass,
    List<num>? manaCost,
    List<num>? attack,
    List<num>? health,
    List<num>? collectible,
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
  Future<List<CardDTO>> getCards({
    num page = 0,
    String locale = "en_US",
    String? set,
    String? heroClass,
    List<num>? manaCost,
    List<num>? attack,
    List<num>? health,
    List<num>? collectible,
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
    // TODO PAGE

    final cardResponse = await _apiService.apiClient.getCards(
        page: page, locale: locale, set: set, heroClass: heroClass, manaCost: manaCost, textFilter: textFilter);
    return cardResponse.cards;
  }
}
