import "package:freezed_annotation/freezed_annotation.dart";

part "token_response.freezed.dart";
part "token_response.g.dart";

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "token_type") required String tokenType,
    @JsonKey(name: "expires_in") required int expiresIn,
    @JsonKey(name: "sub") required String sub,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
}
