import 'package:freezed_annotation/freezed_annotation.dart';

part 'duels_dto.freezed.dart';
part 'duels_dto.g.dart';

@freezed
class DuelsDTO with _$DuelsDTO {
  const factory DuelsDTO({
    required bool? relevant,
    required bool? constructed,
  }) = _DuelsDTO;

  factory DuelsDTO.fromJson(Map<String, dynamic> json) =>
      _$DuelsDTOFromJson(json);
}
