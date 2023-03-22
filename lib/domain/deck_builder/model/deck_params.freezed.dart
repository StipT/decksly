// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeckParams {
  String? get ids => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get hero => throw _privateConstructorUsedError;
  String get deckType => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckParamsCopyWith<DeckParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckParamsCopyWith<$Res> {
  factory $DeckParamsCopyWith(
          DeckParams value, $Res Function(DeckParams) then) =
      _$DeckParamsCopyWithImpl<$Res, DeckParams>;
  @useResult
  $Res call(
      {String? ids,
      String? code,
      String? hero,
      String deckType,
      String locale});
}

/// @nodoc
class _$DeckParamsCopyWithImpl<$Res, $Val extends DeckParams>
    implements $DeckParamsCopyWith<$Res> {
  _$DeckParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? code = freezed,
    Object? hero = freezed,
    Object? deckType = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      hero: freezed == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as String?,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckParamsCopyWith<$Res>
    implements $DeckParamsCopyWith<$Res> {
  factory _$$_DeckParamsCopyWith(
          _$_DeckParams value, $Res Function(_$_DeckParams) then) =
      __$$_DeckParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ids,
      String? code,
      String? hero,
      String deckType,
      String locale});
}

/// @nodoc
class __$$_DeckParamsCopyWithImpl<$Res>
    extends _$DeckParamsCopyWithImpl<$Res, _$_DeckParams>
    implements _$$_DeckParamsCopyWith<$Res> {
  __$$_DeckParamsCopyWithImpl(
      _$_DeckParams _value, $Res Function(_$_DeckParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? code = freezed,
    Object? hero = freezed,
    Object? deckType = null,
    Object? locale = null,
  }) {
    return _then(_$_DeckParams(
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      hero: freezed == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as String?,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeckParams implements _DeckParams {
  const _$_DeckParams(
      {this.ids = "",
      this.code = "",
      this.hero = "",
      this.deckType = "standard",
      this.locale = "en_US"});

  @override
  @JsonKey()
  final String? ids;
  @override
  @JsonKey()
  final String? code;
  @override
  @JsonKey()
  final String? hero;
  @override
  @JsonKey()
  final String deckType;
  @override
  @JsonKey()
  final String locale;

  @override
  String toString() {
    return 'DeckParams(ids: $ids, code: $code, hero: $hero, deckType: $deckType, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckParams &&
            (identical(other.ids, ids) || other.ids == ids) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.hero, hero) || other.hero == hero) &&
            (identical(other.deckType, deckType) ||
                other.deckType == deckType) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ids, code, hero, deckType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckParamsCopyWith<_$_DeckParams> get copyWith =>
      __$$_DeckParamsCopyWithImpl<_$_DeckParams>(this, _$identity);
}

abstract class _DeckParams implements DeckParams {
  const factory _DeckParams(
      {final String? ids,
      final String? code,
      final String? hero,
      final String deckType,
      final String locale}) = _$_DeckParams;

  @override
  String? get ids;
  @override
  String? get code;
  @override
  String? get hero;
  @override
  String get deckType;
  @override
  String get locale;
  @override
  @JsonKey(ignore: true)
  _$$_DeckParamsCopyWith<_$_DeckParams> get copyWith =>
      throw _privateConstructorUsedError;
}
