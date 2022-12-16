import 'package:decksly/repository/remote_source/api/dto/duels_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_dto.freezed.dart';
part 'card_dto.g.dart';

@freezed
class CardDTO with _$CardDTO {
  const factory CardDTO({
    required int id,
    required int collectible,
    required String slug,
    required int classId,
    required List<String> multiClassIds,
    required int spellSchoolId,
    required int cardTypeId,
    required int cardSetId,
    required int rarityId,
    required int parentId,
    required String artistName,
    required int manaCost,
    required String name,
    required String text,
    required String image,
    required String  imageGold,
    required String flavorText,
    required String cropImage,
    required List<String> keywordIds,
    required DuelsDTO duels,
  }) = _CardDTO;

  factory CardDTO.fromJson(Map<String, dynamic> json) => _$CardDTOFromJson(json);
}
