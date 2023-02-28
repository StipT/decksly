// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeckCard {
  CardDTO get card => throw _privateConstructorUsedError;

  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckCardCopyWith<DeckCard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCardCopyWith<$Res> {
  factory $DeckCardCopyWith(DeckCard value, $Res Function(DeckCard) then) = _$DeckCardCopyWithImpl<$Res, DeckCard>;

  @useResult
  $Res call({CardDTO card, int amount});

  $CardDTOCopyWith<$Res> get card;
}

/// @nodoc
class _$DeckCardCopyWithImpl<$Res, $Val extends DeckCard> implements $DeckCardCopyWith<$Res> {
  _$DeckCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardDTO,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_DeckCardCopyWith<$Res> implements $DeckCardCopyWith<$Res> {
  factory _$$_DeckCardCopyWith(_$_DeckCard value, $Res Function(_$_DeckCard) then) = __$$_DeckCardCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({CardDTO card, int amount});

  @override
  $CardDTOCopyWith<$Res> get card;
}

/// @nodoc
class __$$_DeckCardCopyWithImpl<$Res> extends _$DeckCardCopyWithImpl<$Res, _$_DeckCard>
    implements _$$_DeckCardCopyWith<$Res> {
  __$$_DeckCardCopyWithImpl(_$_DeckCard _value, $Res Function(_$_DeckCard) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? amount = null,
  }) {
    return _then(_$_DeckCard(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardDTO,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeckCard implements _DeckCard {
  const _$_DeckCard({required this.card, this.amount = 1});

  @override
  final CardDTO card;
  @override
  @JsonKey()
  final int amount;

  @override
  String toString() {
    return 'DeckCard(card: $card, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCard &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, card, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCardCopyWith<_$_DeckCard> get copyWith => __$$_DeckCardCopyWithImpl<_$_DeckCard>(this, _$identity);
}

abstract class _DeckCard implements DeckCard {
  const factory _DeckCard({required final CardDTO card, final int amount}) = _$_DeckCard;

  @override
  CardDTO get card;

  @override
  int get amount;

  @override
  @JsonKey(ignore: true)
  _$$_DeckCardCopyWith<_$_DeckCard> get copyWith => throw _privateConstructorUsedError;
}
