// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeckResponse _$DeckResponseFromJson(Map<String, dynamic> json) {
  return _DeckResponse.fromJson(json);
}

/// @nodoc
mixin _$DeckResponse {
  String get deckCode => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  CardDTO? get hero => throw _privateConstructorUsedError;
  CardDTO? get heroPower => throw _privateConstructorUsedError;
  List<CardDTO> get cards => throw _privateConstructorUsedError;
  int? get cardCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  ClassDTO? get deckClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'format')
  String get deckType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckResponseCopyWith<DeckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckResponseCopyWith<$Res> {
  factory $DeckResponseCopyWith(
          DeckResponse value, $Res Function(DeckResponse) then) =
      _$DeckResponseCopyWithImpl<$Res, DeckResponse>;
  @useResult
  $Res call(
      {String deckCode,
      int? version,
      CardDTO? hero,
      CardDTO? heroPower,
      List<CardDTO> cards,
      int? cardCount,
      @JsonKey(name: 'class') ClassDTO? deckClass,
      @JsonKey(name: 'format') String deckType});

  $CardDTOCopyWith<$Res>? get hero;
  $CardDTOCopyWith<$Res>? get heroPower;
  $ClassDTOCopyWith<$Res>? get deckClass;
}

/// @nodoc
class _$DeckResponseCopyWithImpl<$Res, $Val extends DeckResponse>
    implements $DeckResponseCopyWith<$Res> {
  _$DeckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCode = null,
    Object? version = freezed,
    Object? hero = freezed,
    Object? heroPower = freezed,
    Object? cards = null,
    Object? cardCount = freezed,
    Object? deckClass = freezed,
    Object? deckType = null,
  }) {
    return _then(_value.copyWith(
      deckCode: null == deckCode
          ? _value.deckCode
          : deckCode // ignore: cast_nullable_to_non_nullable
              as String,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      hero: freezed == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as CardDTO?,
      heroPower: freezed == heroPower
          ? _value.heroPower
          : heroPower // ignore: cast_nullable_to_non_nullable
              as CardDTO?,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>,
      cardCount: freezed == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as int?,
      deckClass: freezed == deckClass
          ? _value.deckClass
          : deckClass // ignore: cast_nullable_to_non_nullable
              as ClassDTO?,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDTOCopyWith<$Res>? get hero {
    if (_value.hero == null) {
      return null;
    }

    return $CardDTOCopyWith<$Res>(_value.hero!, (value) {
      return _then(_value.copyWith(hero: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardDTOCopyWith<$Res>? get heroPower {
    if (_value.heroPower == null) {
      return null;
    }

    return $CardDTOCopyWith<$Res>(_value.heroPower!, (value) {
      return _then(_value.copyWith(heroPower: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassDTOCopyWith<$Res>? get deckClass {
    if (_value.deckClass == null) {
      return null;
    }

    return $ClassDTOCopyWith<$Res>(_value.deckClass!, (value) {
      return _then(_value.copyWith(deckClass: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeckResponseCopyWith<$Res>
    implements $DeckResponseCopyWith<$Res> {
  factory _$$_DeckResponseCopyWith(
          _$_DeckResponse value, $Res Function(_$_DeckResponse) then) =
      __$$_DeckResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deckCode,
      int? version,
      CardDTO? hero,
      CardDTO? heroPower,
      List<CardDTO> cards,
      int? cardCount,
      @JsonKey(name: 'class') ClassDTO? deckClass,
      @JsonKey(name: 'format') String deckType});

  @override
  $CardDTOCopyWith<$Res>? get hero;
  @override
  $CardDTOCopyWith<$Res>? get heroPower;
  @override
  $ClassDTOCopyWith<$Res>? get deckClass;
}

/// @nodoc
class __$$_DeckResponseCopyWithImpl<$Res>
    extends _$DeckResponseCopyWithImpl<$Res, _$_DeckResponse>
    implements _$$_DeckResponseCopyWith<$Res> {
  __$$_DeckResponseCopyWithImpl(
      _$_DeckResponse _value, $Res Function(_$_DeckResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCode = null,
    Object? version = freezed,
    Object? hero = freezed,
    Object? heroPower = freezed,
    Object? cards = null,
    Object? cardCount = freezed,
    Object? deckClass = freezed,
    Object? deckType = null,
  }) {
    return _then(_$_DeckResponse(
      deckCode: null == deckCode
          ? _value.deckCode
          : deckCode // ignore: cast_nullable_to_non_nullable
              as String,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      hero: freezed == hero
          ? _value.hero
          : hero // ignore: cast_nullable_to_non_nullable
              as CardDTO?,
      heroPower: freezed == heroPower
          ? _value.heroPower
          : heroPower // ignore: cast_nullable_to_non_nullable
              as CardDTO?,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>,
      cardCount: freezed == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as int?,
      deckClass: freezed == deckClass
          ? _value.deckClass
          : deckClass // ignore: cast_nullable_to_non_nullable
              as ClassDTO?,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeckResponse implements _DeckResponse {
  const _$_DeckResponse(
      {required this.deckCode,
      required this.version,
      required this.hero,
      required this.heroPower,
      required final List<CardDTO> cards,
      required this.cardCount,
      @JsonKey(name: 'class') required this.deckClass,
      @JsonKey(name: 'format') required this.deckType})
      : _cards = cards;

  factory _$_DeckResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DeckResponseFromJson(json);

  @override
  final String deckCode;
  @override
  final int? version;
  @override
  final CardDTO? hero;
  @override
  final CardDTO? heroPower;
  final List<CardDTO> _cards;
  @override
  List<CardDTO> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int? cardCount;
  @override
  @JsonKey(name: 'class')
  final ClassDTO? deckClass;
  @override
  @JsonKey(name: 'format')
  final String deckType;

  @override
  String toString() {
    return 'DeckResponse(deckCode: $deckCode, version: $version, hero: $hero, heroPower: $heroPower, cards: $cards, cardCount: $cardCount, deckClass: $deckClass, deckType: $deckType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckResponse &&
            (identical(other.deckCode, deckCode) ||
                other.deckCode == deckCode) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.hero, hero) || other.hero == hero) &&
            (identical(other.heroPower, heroPower) ||
                other.heroPower == heroPower) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.cardCount, cardCount) ||
                other.cardCount == cardCount) &&
            (identical(other.deckClass, deckClass) ||
                other.deckClass == deckClass) &&
            (identical(other.deckType, deckType) ||
                other.deckType == deckType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deckCode,
      version,
      hero,
      heroPower,
      const DeepCollectionEquality().hash(_cards),
      cardCount,
      deckClass,
      deckType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckResponseCopyWith<_$_DeckResponse> get copyWith =>
      __$$_DeckResponseCopyWithImpl<_$_DeckResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckResponseToJson(
      this,
    );
  }
}

abstract class _DeckResponse implements DeckResponse {
  const factory _DeckResponse(
          {required final String deckCode,
          required final int? version,
          required final CardDTO? hero,
          required final CardDTO? heroPower,
          required final List<CardDTO> cards,
          required final int? cardCount,
          @JsonKey(name: 'class') required final ClassDTO? deckClass,
          @JsonKey(name: 'format') required final String deckType}) =
      _$_DeckResponse;

  factory _DeckResponse.fromJson(Map<String, dynamic> json) =
      _$_DeckResponse.fromJson;

  @override
  String get deckCode;
  @override
  int? get version;
  @override
  CardDTO? get hero;
  @override
  CardDTO? get heroPower;
  @override
  List<CardDTO> get cards;
  @override
  int? get cardCount;
  @override
  @JsonKey(name: 'class')
  ClassDTO? get deckClass;
  @override
  @JsonKey(name: 'format')
  String get deckType;
  @override
  @JsonKey(ignore: true)
  _$$_DeckResponseCopyWith<_$_DeckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
