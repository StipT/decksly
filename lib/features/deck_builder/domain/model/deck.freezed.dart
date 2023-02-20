// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Deck {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  List<DeckCard> get cards => throw _privateConstructorUsedError;
  DeckType get type => throw _privateConstructorUsedError;
  DeckClass get heroClass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckCopyWith<Deck> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) then) =
      _$DeckCopyWithImpl<$Res, Deck>;
  @useResult
  $Res call(
      {String name,
      String code,
      List<DeckCard> cards,
      DeckType type,
      DeckClass heroClass});
}

/// @nodoc
class _$DeckCopyWithImpl<$Res, $Val extends Deck>
    implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? cards = null,
    Object? type = null,
    Object? heroClass = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<DeckCard>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeckType,
      heroClass: null == heroClass
          ? _value.heroClass
          : heroClass // ignore: cast_nullable_to_non_nullable
              as DeckClass,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$$_DeckCopyWith(_$_Deck value, $Res Function(_$_Deck) then) =
      __$$_DeckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String code,
      List<DeckCard> cards,
      DeckType type,
      DeckClass heroClass});
}

/// @nodoc
class __$$_DeckCopyWithImpl<$Res> extends _$DeckCopyWithImpl<$Res, _$_Deck>
    implements _$$_DeckCopyWith<$Res> {
  __$$_DeckCopyWithImpl(_$_Deck _value, $Res Function(_$_Deck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? cards = null,
    Object? type = null,
    Object? heroClass = null,
  }) {
    return _then(_$_Deck(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<DeckCard>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeckType,
      heroClass: null == heroClass
          ? _value.heroClass
          : heroClass // ignore: cast_nullable_to_non_nullable
              as DeckClass,
    ));
  }
}

/// @nodoc

class _$_Deck implements _Deck {
  const _$_Deck(
      {this.name = "",
      this.code = "",
      final List<DeckCard> cards = const [],
      this.type = DeckType.standard,
      this.heroClass = DeckClass.warrior})
      : _cards = cards;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;
  final List<DeckCard> _cards;
  @override
  @JsonKey()
  List<DeckCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  @JsonKey()
  final DeckType type;
  @override
  @JsonKey()
  final DeckClass heroClass;

  @override
  String toString() {
    return 'Deck(name: $name, code: $code, cards: $cards, type: $type, heroClass: $heroClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Deck &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.heroClass, heroClass) ||
                other.heroClass == heroClass));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, code,
      const DeepCollectionEquality().hash(_cards), type, heroClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCopyWith<_$_Deck> get copyWith =>
      __$$_DeckCopyWithImpl<_$_Deck>(this, _$identity);
}

abstract class _Deck implements Deck {
  const factory _Deck(
      {final String name,
      final String code,
      final List<DeckCard> cards,
      final DeckType type,
      final DeckClass heroClass}) = _$_Deck;

  @override
  String get name;
  @override
  String get code;
  @override
  List<DeckCard> get cards;
  @override
  DeckType get type;
  @override
  DeckClass get heroClass;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCopyWith<_$_Deck> get copyWith => throw _privateConstructorUsedError;
}
