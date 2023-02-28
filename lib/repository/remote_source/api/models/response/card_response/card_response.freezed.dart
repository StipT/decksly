// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardResponse _$CardResponseFromJson(Map<String, dynamic> json) {
  return _CardResponse.fromJson(json);
}

/// @nodoc
mixin _$CardResponse {
  CardDTO get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardResponseCopyWith<CardResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardResponseCopyWith<$Res> {
  factory $CardResponseCopyWith(CardResponse value, $Res Function(CardResponse) then) =
      _$CardResponseCopyWithImpl<$Res, CardResponse>;

  @useResult
  $Res call({CardDTO card});

  $CardDTOCopyWith<$Res> get card;
}

/// @nodoc
class _$CardResponseCopyWithImpl<$Res, $Val extends CardResponse> implements $CardResponseCopyWith<$Res> {
  _$CardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
  }) {
    return _then(_value.copyWith(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDTOCopyWith<$Res> get card {
    return $CardDTOCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardResponseCopyWith<$Res> implements $CardResponseCopyWith<$Res> {
  factory _$$_CardResponseCopyWith(_$_CardResponse value, $Res Function(_$_CardResponse) then) =
      __$$_CardResponseCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({CardDTO card});

  @override
  $CardDTOCopyWith<$Res> get card;
}

/// @nodoc
class __$$_CardResponseCopyWithImpl<$Res> extends _$CardResponseCopyWithImpl<$Res, _$_CardResponse>
    implements _$$_CardResponseCopyWith<$Res> {
  __$$_CardResponseCopyWithImpl(_$_CardResponse _value, $Res Function(_$_CardResponse) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
  }) {
    return _then(_$_CardResponse(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardResponse implements _CardResponse {
  const _$_CardResponse({required this.card});

  factory _$_CardResponse.fromJson(Map<String, dynamic> json) => _$$_CardResponseFromJson(json);

  @override
  final CardDTO card;

  @override
  String toString() {
    return 'CardResponse(card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardResponse &&
            (identical(other.card, card) || other.card == card));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, card);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardResponseCopyWith<_$_CardResponse> get copyWith =>
      __$$_CardResponseCopyWithImpl<_$_CardResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardResponseToJson(
      this,
    );
  }
}

abstract class _CardResponse implements CardResponse {
  const factory _CardResponse({required final CardDTO card}) = _$_CardResponse;

  factory _CardResponse.fromJson(Map<String, dynamic> json) = _$_CardResponse.fromJson;

  @override
  CardDTO get card;

  @override
  @JsonKey(ignore: true)
  _$$_CardResponseCopyWith<_$_CardResponse> get copyWith => throw _privateConstructorUsedError;
}
