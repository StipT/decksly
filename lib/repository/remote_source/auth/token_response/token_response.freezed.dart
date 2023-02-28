// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return _TokenResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenResponse {
  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;

  @JsonKey(name: "token_type")
  String get tokenType => throw _privateConstructorUsedError;

  @JsonKey(name: "expires_in")
  int get expiresIn => throw _privateConstructorUsedError;

  @JsonKey(name: "sub")
  String get sub => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenResponseCopyWith<TokenResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;

  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "token_type") String tokenType,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "sub") String sub});
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse> implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? sub = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenResponseCopyWith<$Res> implements $TokenResponseCopyWith<$Res> {
  factory _$$_TokenResponseCopyWith(_$_TokenResponse value, $Res Function(_$_TokenResponse) then) =
      __$$_TokenResponseCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "token_type") String tokenType,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "sub") String sub});
}

/// @nodoc
class __$$_TokenResponseCopyWithImpl<$Res> extends _$TokenResponseCopyWithImpl<$Res, _$_TokenResponse>
    implements _$$_TokenResponseCopyWith<$Res> {
  __$$_TokenResponseCopyWithImpl(_$_TokenResponse _value, $Res Function(_$_TokenResponse) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? sub = null,
  }) {
    return _then(_$_TokenResponse(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenResponse implements _TokenResponse {
  const _$_TokenResponse(
      {@JsonKey(name: "access_token") required this.accessToken,
      @JsonKey(name: "token_type") required this.tokenType,
      @JsonKey(name: "expires_in") required this.expiresIn,
      @JsonKey(name: "sub") required this.sub});

  factory _$_TokenResponse.fromJson(Map<String, dynamic> json) => _$$_TokenResponseFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String accessToken;
  @override
  @JsonKey(name: "token_type")
  final String tokenType;
  @override
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @override
  @JsonKey(name: "sub")
  final String sub;

  @override
  String toString() {
    return 'TokenResponse(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, sub: $sub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenResponse &&
            (identical(other.accessToken, accessToken) || other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) || other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn) &&
            (identical(other.sub, sub) || other.sub == sub));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType, expiresIn, sub);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenResponseCopyWith<_$_TokenResponse> get copyWith =>
      __$$_TokenResponseCopyWithImpl<_$_TokenResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenResponseToJson(
      this,
    );
  }
}

abstract class _TokenResponse implements TokenResponse {
  const factory _TokenResponse(
      {@JsonKey(name: "access_token") required final String accessToken,
      @JsonKey(name: "token_type") required final String tokenType,
      @JsonKey(name: "expires_in") required final int expiresIn,
      @JsonKey(name: "sub") required final String sub}) = _$_TokenResponse;

  factory _TokenResponse.fromJson(Map<String, dynamic> json) = _$_TokenResponse.fromJson;

  @override
  @JsonKey(name: "access_token")
  String get accessToken;

  @override
  @JsonKey(name: "token_type")
  String get tokenType;

  @override
  @JsonKey(name: "expires_in")
  int get expiresIn;

  @override
  @JsonKey(name: "sub")
  String get sub;

  @override
  @JsonKey(ignore: true)
  _$$_TokenResponseCopyWith<_$_TokenResponse> get copyWith => throw _privateConstructorUsedError;
}
