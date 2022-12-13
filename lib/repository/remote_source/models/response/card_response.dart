import 'package:decksly/repository/remote_source/dto/card_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_response.g.dart';

@JsonSerializable()
class CardResponse {
  CardResponse({
    required this.card,
  });

  factory CardResponse.fromJson(Map<String, dynamic> json) =>
      _$CardResponseFromJson(json);

  final CardDTO card;

  Map<String, dynamic> toJson() => _$CardResponseToJson(this);
}
