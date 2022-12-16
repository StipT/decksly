// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenRequest _$$_TokenRequestFromJson(Map<String, dynamic> json) =>
    _$_TokenRequest(
      grantType: json['grant_type'] as String,
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
    );

Map<String, dynamic> _$$_TokenRequestToJson(_$_TokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
