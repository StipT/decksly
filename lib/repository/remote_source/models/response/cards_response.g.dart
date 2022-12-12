// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsResponse _$CardsResponseFromJson(Map<String, dynamic> json) =>
    CardsResponse(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardCount: json['cardCount'] as int,
      pageCount: json['pageCount'] as int,
      page: json['page'] as int,
    );

Map<String, dynamic> _$CardsResponseToJson(CardsResponse instance) =>
    <String, dynamic>{
      'cards': instance.cards,
      'cardCount': instance.cardCount,
      'pageCount': instance.pageCount,
      'page': instance.page,
    };
