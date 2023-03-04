// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckResponse _$$_DeckResponseFromJson(Map<String, dynamic> json) =>
    _$_DeckResponse(
      deckCode: json['deckCode'] as String,
      version: json['version'] as int?,
      hero: json['hero'] == null
          ? null
          : CardDTO.fromJson(json['hero'] as Map<String, dynamic>),
      heroPower: json['heroPower'] == null
          ? null
          : CardDTO.fromJson(json['heroPower'] as Map<String, dynamic>),
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardCount: json['cardCount'] as int?,
      deckClass: json['class'] == null
          ? null
          : ClassDTO.fromJson(json['class'] as Map<String, dynamic>),
      deckType: json['format'] as String,
    );

Map<String, dynamic> _$$_DeckResponseToJson(_$_DeckResponse instance) =>
    <String, dynamic>{
      'deckCode': instance.deckCode,
      'version': instance.version,
      'hero': instance.hero,
      'heroPower': instance.heroPower,
      'cards': instance.cards,
      'cardCount': instance.cardCount,
      'class': instance.deckClass,
      'format': instance.deckType,
    };
