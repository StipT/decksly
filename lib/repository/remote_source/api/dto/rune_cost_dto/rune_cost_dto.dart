import 'package:freezed_annotation/freezed_annotation.dart';

part 'rune_cost_dto.freezed.dart';
part 'rune_cost_dto.g.dart';

@freezed
class RuneCostDTO with _$RuneCostDTO {
  const factory RuneCostDTO({
    required int blood,
    required int frost,
    required int unholy,
  }) = _RuneCostDTO;

  factory RuneCostDTO.fromJson(Map<String, dynamic> json) =>
      _$RuneCostDTOFromJson(json);
}
