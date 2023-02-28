import 'package:decksly/common/application.constants.dart';
import 'package:decksly/repository/remote_source/api/models/response/cards_response/cards_response.dart';
import 'package:decksly/repository/remote_source/api/models/response/deck_response/deck_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: API_BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/hearthstone/cards')
  Future<CardsResponse> getCards({
    @Query("pageSize") num? pageSize,
    @Query("page") num? page,
    @Query("locale") String? locale,
    @Query("set") String? set,
    @Query("class") String? heroClass,
    @Query("manaCost") String? manaCost,
    @Query("attack") String? attack,
    @Query("health") String? health,
    @Query("collectible") String? collectible,
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
    @Query("locale") String? locale,
    @Query("gameMode") String? gameMode,
  });

  @GET('/hearthstone/deck')
  Future<DeckResponse> getDeck(
    @Query("code") String? deckCode,
    @Query("locale") String locale,
  );

  @GET('/hearthstone/deck')
  Future<DeckResponse> getDeckCode(
    @Query("ids") String? ids,
    @Query("locale") String locale,
  );
}
