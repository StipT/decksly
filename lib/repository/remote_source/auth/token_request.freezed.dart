// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) {
  return _TokenRequest.fromJson(json);
}

/// @nodoc
mixin _$TokenRequest {
  @JsonKey(name: "grant_type")
  String get grantType => throw _privateConstructorUsedError;
  @JsonKey(name: "client_id")
  String get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: "client_secret")
  String get clientSecret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenRequestCopyWith<TokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRequestCopyWith<$Res> {
  factory $TokenRequestCopyWith(
          TokenRequest value, $Res Function(TokenRequest) then) =
      _$TokenRequestCopyWithImpl<$Res, TokenRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "grant_type") String grantType,
      @JsonKey(name: "client_id") String clientId,
      @JsonKey(name: "client_secret") String clientSecret});
}

/// @nodoc
class _$TokenRequestCopyWithImpl<$Res, $Val extends TokenRequest>
    implements $TokenRequestCopyWith<$Res> {
  _$TokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantType = null,
    Object? clientId = null,
    Object? clientSecret = null,
  }) {
    return _then(_value.copyWith(
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenRequestCopyWith<$Res>
    implements $TokenRequestCopyWith<$Res> {
  factory _$$_TokenRequestCopyWith(
          _$_TokenRequest value, $Res Function(_$_TokenRequest) then) =
      __$$_TokenRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "grant_type") String grantType,
      @JsonKey(name: "client_id") String clientId,
      @JsonKey(name: "client_secret") String clientSecret});
}

/// @nodoc
class __$$_TokenRequestCopyWithImpl<$Res>
    extends _$TokenRequestCopyWithImpl<$Res, _$_TokenRequest>
    implements _$$_TokenRequestCopyWith<$Res> {
  __$$_TokenRequestCopyWithImpl(
      _$_TokenRequest _value, $Res Function(_$_TokenRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantType = null,
    Object? clientId = null,
    Object? clientSecret = null,
  }) {
    return _then(_$_TokenRequest(
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenRequest implements _TokenRequest {
  const _$_TokenRequest(
      {@JsonKey(name: "grant_type") required this.grantType,
      @JsonKey(name: "client_id") required this.clientId,
      @JsonKey(name: "client_secret") required this.clientSecret});

  factory _$_TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TokenRequestFromJson(json);

  @override
  @JsonKey(name: "grant_type")
  final String grantType;
  @override
  @JsonKey(name: "client_id")
  final String clientId;
  @override
  @JsonKey(name: "client_secret")
  final String clientSecret;

  @override
  String toString() {
    return 'TokenRequest(grantType: $grantType, clientId: $clientId, clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenRequest &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, grantType, clientId, clientSecret);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenRequestCopyWith<_$_TokenRequest> get copyWith =>
      __$$_TokenRequestCopyWithImpl<_$_TokenRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenRequestToJson(
      this,
    );
  }
}

abstract class _TokenRequest implements TokenRequest {
  const factory _TokenRequest(
          {@JsonKey(name: "grant_type") required final String grantType,
          @JsonKey(name: "client_id") required final String clientId,
          @JsonKey(name: "client_secret") required final String clientSecret}) =
      _$_TokenRequest;

  factory _TokenRequest.fromJson(Map<String, dynamic> json) =
      _$_TokenRequest.fromJson;

  @override
  @JsonKey(name: "grant_type")
  String get grantType;
  @override
  @JsonKey(name: "client_id")
  String get clientId;
  @override
  @JsonKey(name: "client_secret")
  String get clientSecret;
  @override
  @JsonKey(ignore: true)
  _$$_TokenRequestCopyWith<_$_TokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
