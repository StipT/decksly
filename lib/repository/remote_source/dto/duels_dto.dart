import 'package:json_annotation/json_annotation.dart';

part 'duels_dto.g.dart';

@JsonSerializable()
class DuelsDTO {
  DuelsDTO({
    required this.relevant,
    required this.constructed,
  });

  factory DuelsDTO.fromJson(Map<String, dynamic> json) =>
      _$DuelsDTOFromJson(json);

  final bool relevant;
  final bool constructed;

  Map<String, dynamic> toJson() => _$DuelsDTOToJson(this);
}
