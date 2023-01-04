// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardDTO _$$_CardDTOFromJson(Map<String, dynamic> json) => _$_CardDTO(
      id: json['id'] as int,
      cardSetId: json['cardSetId'] as int,
      classId: json['classId'] as int,
      parentId: json['parentId'] as int?,
      cardTypeId: json['cardTypeId'] as int,
      rarityId: json['rarityId'] as int,
      collectible: json['collectible'] as int,
      slug: json['slug'] as String,
      name: json['name'] as String,
      artistName: json['artistName'] as String,
      text: json['text'] as String,
      image: json['image'] as String,
      imageGold: json['imageGold'] as String,
      flavorText: json['flavorText'] as String,
      cropImage: json['cropImage'] as String?,
      manaCost: json['manaCost'] as int,
      duels: json['duels'] == null
          ? null
          : DuelsDTO.fromJson(json['duels'] as Map<String, dynamic>),
      runeCost: json['runeCost'] == null
          ? null
          : RuneCostDTO.fromJson(json['runeCost'] as Map<String, dynamic>),
      keywordIds:
          (json['keywordIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      childIds:
          (json['childIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      spellSchoolId: json['spellSchoolId'] as int?,
      multiClassIds: (json['multiClassIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      multiTypeIds: (json['multiTypeIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      copyOfCardId: json['copyOfCardId'] as int?,
      minionTypeId: json['minionTypeId'] as int?,
      health: json['health'] as int?,
      attack: json['attack'] as int?,
      armor: json['armor'] as int?,
      durability: json['durability'] as int?,
    );

Map<String, dynamic> _$$_CardDTOToJson(_$_CardDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardSetId': instance.cardSetId,
      'classId': instance.classId,
      'parentId': instance.parentId,
      'cardTypeId': instance.cardTypeId,
      'rarityId': instance.rarityId,
      'collectible': instance.collectible,
      'slug': instance.slug,
      'name': instance.name,
      'artistName': instance.artistName,
      'text': instance.text,
      'image': instance.image,
      'imageGold': instance.imageGold,
      'flavorText': instance.flavorText,
      'cropImage': instance.cropImage,
      'manaCost': instance.manaCost,
      'duels': instance.duels,
      'runeCost': instance.runeCost,
      'keywordIds': instance.keywordIds,
      'childIds': instance.childIds,
      'spellSchoolId': instance.spellSchoolId,
      'multiClassIds': instance.multiClassIds,
      'multiTypeIds': instance.multiTypeIds,
      'copyOfCardId': instance.copyOfCardId,
      'minionTypeId': instance.minionTypeId,
      'health': instance.health,
      'attack': instance.attack,
      'armor': instance.armor,
      'durability': instance.durability,
    };
