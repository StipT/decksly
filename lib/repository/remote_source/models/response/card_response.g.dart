// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponse _$CardResponseFromJson(Map<String, dynamic> json) => CardResponse(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardCount: json['cardCount'] as int,
      pageCount: json['pageCount'] as int,
      page: json['page'] as int,
    );

Map<String, dynamic> _$CardResponseToJson(CardResponse instance) =>
    <String, dynamic>{
      'cards': instance.cards,
      'cardCount': instance.cardCount,
      'pageCount': instance.pageCount,
      'page': instance.page,
    };
