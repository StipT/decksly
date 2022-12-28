import 'package:decksly/common/application.constants.dart';
import 'package:decksly/repository/remote_source/api/models/response/cards_response/cards_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: API_BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/hearthstone/cards')
  Future<CardsResponse> getCards({
    @Query("page") num page = 0,
    @Query("locale") String locale = "en_US",
    @Query("set") String? set,
    @Query("class") String? heroClass,
    @Query("manaCost") List<num>? manaCost,
    @Query("attack") List<num>? attack,
    @Query("health") List<num>? health,
    @Query("collectible") List<num>? collectible,
    @Query("rarity") String? rarity,
    @Query("type") String? type,
    @Query("minionType") String? minionType,
    @Query("keyword") String? keyword,
    @Query("textFilter") String? textFilter,
    @Query("gameMode") String? gameMode,
    @Query("spellSchool") String? spellSchool,
    @Query("sort") String? sort,
  });

  @GET('/hearthstone/cards/{id}')
  Future<CardsResponse> getCard(
    @Path() String id, {
    @Query("locale") String locale = "en_US",
    @Query("gameMode") String? gameMode,
  });

//TODO deck-15 Create request/response models for fetching decks/deck codes
/*
    @GET('/hearthstone/deck')
  Future<DeckResponse> getDeck(
    @Query("locale") String locale,
    @Query("code") String code,
    @Query("hero") String hero,
  );

  @GET('/hearthstone/deck')
  Future<DeckCodeResponse> getDeckCode(
    @Query("locale") String locale,
    @Query("ids") String ids, // Comma separated ID list
    @Query("hero") String hero,
  );
*/
}
