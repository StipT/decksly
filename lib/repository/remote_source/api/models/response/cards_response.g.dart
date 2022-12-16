// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardsResponse _$$_CardsResponseFromJson(Map<String, dynamic> json) =>
    _$_CardsResponse(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardCount: json['cardCount'] as int,
      pageCount: json['pageCount'] as int,
      page: json['page'] as int,
    );

Map<String, dynamic> _$$_CardsResponseToJson(_$_CardsResponse instance) =>
    <String, dynamic>{
      'cards': instance.cards,
      'cardCount': instance.cardCount,
      'pageCount': instance.pageCount,
      'page': instance.page,
    };
