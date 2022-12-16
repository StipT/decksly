import 'package:decksly/common/application.constants.dart';
import 'package:decksly/repository/remote_source/api/models/response/cards_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: API_BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/hearthstone/cards')
  Future<CardsResponse> getCards();

  @GET('/hearthstone/cards/{id}')
  Future<CardsResponse> getMovies(@Path() String id);

}