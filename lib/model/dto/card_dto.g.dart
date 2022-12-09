// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDTO _$CardDTOFromJson(Map<String, dynamic> json) => CardDTO(
      id: json['id'] as int,
      collectible: json['collectible'] as int,
      slug: json['slug'] as String,
      classId: json['classId'] as int,
      multiClassIds: (json['multiClassIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      spellSchoolId: json['spellSchoolId'] as bool,
      cardTypeId: json['cardTypeId'] as int,
      cardSetId: json['cardSetId'] as int,
      rarityId: json['rarityId'] as int,
      artistName: json['artistName'] as String,
      manaCost: json['manaCost'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      image: json['image'] as String,
      imageGold: json['imageGold'] as String,
      flavorText: json['flavorText'] as String,
      cropImage: json['cropImage'] as String,
      keywordIds: (json['keywordIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      duels: DuelsDTO.fromJson(json['duels'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardDTOToJson(CardDTO instance) => <String, dynamic>{
      'id': instance.id,
      'collectible': instance.collectible,
      'slug': instance.slug,
      'classId': instance.classId,
      'multiClassIds': instance.multiClassIds,
      'spellSchoolId': instance.spellSchoolId,
      'cardTypeId': instance.cardTypeId,
      'cardSetId': instance.cardSetId,
      'rarityId': instance.rarityId,
      'artistName': instance.artistName,
      'manaCost': instance.manaCost,
      'name': instance.name,
      'text': instance.text,
      'image': instance.image,
      'imageGold': instance.imageGold,
      'flavorText': instance.flavorText,
      'cropImage': instance.cropImage,
      'keywordIds': instance.keywordIds,
      'duels': instance.duels,
    };
