import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_request.g.dart';
part 'token_request.freezed.dart';

@freezed
class TokenRequest with _$TokenRequest {
  const factory TokenRequest({
    @JsonKey(name: "grant_type") required String grantType,
    @JsonKey(name: "client_id") required String clientId,
    @JsonKey(name: "client_secret") required String clientSecret,
  }) = _TokenRequest;

  factory TokenRequest.fromJson(Map<String, dynamic> json) => _$TokenRequestFromJson(json);

}
