// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenResponse _$$_TokenResponseFromJson(Map<String, dynamic> json) =>
    _$_TokenResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: json['expires_in'] as int,
      sub: json['sub'] as String,
    );

Map<String, dynamic> _$$_TokenResponseToJson(_$_TokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'sub': instance.sub,
    };
