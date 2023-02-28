// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardsResponse _$CardsResponseFromJson(Map<String, dynamic> json) {
  return _CardsResponse.fromJson(json);
}

/// @nodoc
mixin _$CardsResponse {
  List<CardDTO> get cards => throw _privateConstructorUsedError;
  int get cardCount => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardsResponseCopyWith<CardsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsResponseCopyWith<$Res> {
  factory $CardsResponseCopyWith(
          CardsResponse value, $Res Function(CardsResponse) then) =
      _$CardsResponseCopyWithImpl<$Res, CardsResponse>;
  @useResult
  $Res call({List<CardDTO> cards, int cardCount, int pageCount, int page});
}

/// @nodoc
class _$CardsResponseCopyWithImpl<$Res, $Val extends CardsResponse>
    implements $CardsResponseCopyWith<$Res> {
  _$CardsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? cardCount = null,
    Object? pageCount = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>,
      cardCount: null == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardsResponseCopyWith<$Res>
    implements $CardsResponseCopyWith<$Res> {
  factory _$$_CardsResponseCopyWith(
          _$_CardsResponse value, $Res Function(_$_CardsResponse) then) =
      __$$_CardsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CardDTO> cards, int cardCount, int pageCount, int page});
}

/// @nodoc
class __$$_CardsResponseCopyWithImpl<$Res>
    extends _$CardsResponseCopyWithImpl<$Res, _$_CardsResponse>
    implements _$$_CardsResponseCopyWith<$Res> {
  __$$_CardsResponseCopyWithImpl(
      _$_CardsResponse _value, $Res Function(_$_CardsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? cardCount = null,
    Object? pageCount = null,
    Object? page = null,
  }) {
    return _then(_$_CardsResponse(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>,
      cardCount: null == cardCount
          ? _value.cardCount
          : cardCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardsResponse implements _CardsResponse {
  const _$_CardsResponse(
      {required final List<CardDTO> cards,
      required this.cardCount,
      required this.pageCount,
      required this.page})
      : _cards = cards;

  factory _$_CardsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CardsResponseFromJson(json);

  final List<CardDTO> _cards;
  @override
  List<CardDTO> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int cardCount;
  @override
  final int pageCount;
  @override
  final int page;

  @override
  String toString() {
    return 'CardsResponse(cards: $cards, cardCount: $cardCount, pageCount: $pageCount, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardsResponse &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.cardCount, cardCount) ||
                other.cardCount == cardCount) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cards), cardCount, pageCount, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardsResponseCopyWith<_$_CardsResponse> get copyWith =>
      __$$_CardsResponseCopyWithImpl<_$_CardsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardsResponseToJson(
      this,
    );
  }
}

abstract class _CardsResponse implements CardsResponse {
  const factory _CardsResponse(
      {required final List<CardDTO> cards,
      required final int cardCount,
      required final int pageCount,
      required final int page}) = _$_CardsResponse;

  factory _CardsResponse.fromJson(Map<String, dynamic> json) =
      _$_CardsResponse.fromJson;

  @override
  List<CardDTO> get cards;
  @override
  int get cardCount;
  @override
  int get pageCount;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_CardsResponseCopyWith<_$_CardsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
