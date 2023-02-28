import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_request.freezed.dart';
part 'token_request.g.dart';

@freezed
class TokenRequest with _$TokenRequest {
  const factory TokenRequest({
    @JsonKey(name: "grant_type") required String grantType,
  }) = _TokenRequest;

  factory TokenRequest.fromJson(Map<String, dynamic> json) => _$TokenRequestFromJson(json);
}
