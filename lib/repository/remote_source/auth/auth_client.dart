import 'package:decksly/common/application.constants.dart';
import 'package:decksly/repository/remote_source/auth/token_response/token_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: AUTH_BASE_URL)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/token')
  Future<TokenResponse> getAccessToken(
    @Header("Content-Type") String contentType,
    @Header("Authorization") String authorization,
    @Body() String grantType,
  );
}
