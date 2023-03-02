// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardsPage {
  List<CardDTO>? get cards => throw _privateConstructorUsedError;
  int? get cardCount => throw _privateConstructorUsedError;
  int? get pageCount => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardsPageCopyWith<CardsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsPageCopyWith<$Res> {
  factory $CardsPageCopyWith(CardsPage value, $Res Function(CardsPage) then) =
      _$CardsPageCopyWithImpl<$Res, CardsPage>;
  @useResult
  $Res call({List<CardDTO>? cards, int? cardCount, int? pageCount, int? page});
}

/// @nodoc
class _$CardsPageCopyWithImpl<$Res, $Val extends CardsPage>
    implements $CardsPageCopyWith<$Res> {
  _$CardsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = freezed,
    Object? cardCount = freezed,
    Object? pageCount = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>?,
      cardCount: freezed == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardsPageCopyWith<$Res> implements $CardsPageCopyWith<$Res> {
  factory _$$_CardsPageCopyWith(
          _$_CardsPage value, $Res Function(_$_CardsPage) then) =
      __$$_CardsPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CardDTO>? cards, int? cardCount, int? pageCount, int? page});
}

/// @nodoc
class __$$_CardsPageCopyWithImpl<$Res>
    extends _$CardsPageCopyWithImpl<$Res, _$_CardsPage>
    implements _$$_CardsPageCopyWith<$Res> {
  __$$_CardsPageCopyWithImpl(
      _$_CardsPage _value, $Res Function(_$_CardsPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = freezed,
    Object? cardCount = freezed,
    Object? pageCount = freezed,
    Object? page = freezed,
  }) {
    return _then(_$_CardsPage(
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>?,
      cardCount: freezed == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_CardsPage implements _CardsPage {
  const _$_CardsPage(
      {final List<CardDTO>? cards = const [],
      this.cardCount = 0,
      this.pageCount = 0,
      this.page = 0})
      : _cards = cards;

  final List<CardDTO>? _cards;
  @override
  @JsonKey()
  List<CardDTO>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? cardCount;
  @override
  @JsonKey()
  final int? pageCount;
  @override
  @JsonKey()
  final int? page;

  @override
  String toString() {
    return 'CardsPage(cards: $cards, cardCount: $cardCount, pageCount: $pageCount, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardsPage &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.cardCount, cardCount) ||
                other.cardCount == cardCount) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cards), cardCount, pageCount, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardsPageCopyWith<_$_CardsPage> get copyWith =>
      __$$_CardsPageCopyWithImpl<_$_CardsPage>(this, _$identity);
}

abstract class _CardsPage implements CardsPage {
  const factory _CardsPage(
      {final List<CardDTO>? cards,
      final int? cardCount,
      final int? pageCount,
      final int? page}) = _$_CardsPage;

  @override
  List<CardDTO>? get cards;
  @override
  int? get cardCount;
  @override
  int? get pageCount;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$_CardsPageCopyWith<_$_CardsPage> get copyWith =>
      throw _privateConstructorUsedError;
}
