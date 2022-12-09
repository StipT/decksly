import 'package:decksly/model/dto/duels_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_dto.g.dart';

@JsonSerializable()
class CardDTO {
  CardDTO({
    required this.id,
    required this.collectible,
    required this.slug,
    required this.classId,
    required this.multiClassIds,
    required this.spellSchoolId,
    required this.cardTypeId,
    required this.cardSetId,
    required this.rarityId,
    required this.artistName,
    required this.manaCost,
    required this.name,
    required this.text,
    required this.image,
    required this.imageGold,
    required this.flavorText,
    required this.cropImage,
    required this.keywordIds,
    required this.duels,
  });

  factory CardDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDTOFromJson(json);

  final int id;
  final int collectible;
  final String slug;
  final int classId;
  final List<String> multiClassIds;
  final bool spellSchoolId;
  final int cardTypeId;
  final int cardSetId;
  final int rarityId;

  final String artistName;
  final int manaCost;
  final String name;
  final String text;
  final String image;
  final String imageGold;
  final String flavorText;
  final String cropImage;
  final List<String> keywordIds;
  final DuelsDTO duels;

  Map<String, dynamic> toJson() => _$CardDTOToJson(this);

  @override
  int get hashCode => id.hashCode;
}
