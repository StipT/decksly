import "package:decksly/repository/remote_source/api/dto/duels_dto/duels_dto.dart";
import "package:decksly/repository/remote_source/api/dto/rune_cost_dto/rune_cost_dto.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "card_dto.freezed.dart";

part "card_dto.g.dart";

@freezed
class CardDTO with _$CardDTO {
  const factory CardDTO({
    required int id,
    required int? cardSetId,
    required int? classId,
    required int? parentId,
    required int? cardTypeId,
    required int? rarityId,
    required int? collectible,
    required String? slug,
    required String name,
    required String? artistName,
    required String? text,
    required String image,
    required String imageGold,
    required String? flavorText,
    required String? cropImage,
    required int manaCost,
    required DuelsDTO? duels,
    required RuneCostDTO? runeCost,
    required List<int>? keywordIds,
    required List<int>? childIds,
    required int? spellSchoolId,
    required List<int>? multiClassIds,
    required List<int>? multiTypeIds,
    required int? copyOfCardId,
    required int? minionTypeId,
    required int? health,
    required int? attack,
    required int? armor,
    required int? durability,
  }) = _CardDTO;

  factory CardDTO.fromJson(Map<String, dynamic> json) => _$CardDTOFromJson(json);
}
