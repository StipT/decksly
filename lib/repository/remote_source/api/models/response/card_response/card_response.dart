import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_response.freezed.dart';
part 'card_response.g.dart';

@freezed
class CardResponse with _$CardResponse {
  const factory CardResponse({
    required CardDTO card,
  }) = _CardResponse;

  factory CardResponse.fromJson(Map<String, dynamic> json) => _$CardResponseFromJson(json);
}
