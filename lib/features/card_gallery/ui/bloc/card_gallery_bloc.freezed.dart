// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardGalleryState {
  CardFilterParams get cardFilterParams => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        initial,
    required TResult Function(CardFilterParams cardFilterParams) fetching,
    required TResult Function(CardFilterParams cardFilterParams) localeChanged,
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        fetched,
    required TResult Function(
            CardFilterParams cardFilterParams, Failure failure)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult? Function(CardFilterParams cardFilterParams)? fetching,
    TResult? Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult? Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult Function(CardFilterParams cardFilterParams)? fetching,
    TResult Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryFetching value) fetching,
    required TResult Function(_CardGalleryLocaleChanged value) localeChanged,
    required TResult Function(_CardGalleryFetched value) fetched,
    required TResult Function(_CardGalleryError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryFetching value)? fetching,
    TResult? Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult? Function(_CardGalleryFetched value)? fetched,
    TResult? Function(_CardGalleryError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryFetching value)? fetching,
    TResult Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult Function(_CardGalleryFetched value)? fetched,
    TResult Function(_CardGalleryError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardGalleryStateCopyWith<CardGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardGalleryStateCopyWith<$Res> {
  factory $CardGalleryStateCopyWith(
          CardGalleryState value, $Res Function(CardGalleryState) then) =
      _$CardGalleryStateCopyWithImpl<$Res, CardGalleryState>;
  @useResult
  $Res call({CardFilterParams cardFilterParams});

  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
}

/// @nodoc
class _$CardGalleryStateCopyWithImpl<$Res, $Val extends CardGalleryState>
    implements $CardGalleryStateCopyWith<$Res> {
  _$CardGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardFilterParams = null,
  }) {
    return _then(_value.copyWith(
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardFilterParamsCopyWith<$Res> get cardFilterParams {
    return $CardFilterParamsCopyWith<$Res>(_value.cardFilterParams, (value) {
      return _then(_value.copyWith(cardFilterParams: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardGalleryInitialCopyWith<$Res>
    implements $CardGalleryStateCopyWith<$Res> {
  factory _$$_CardGalleryInitialCopyWith(_$_CardGalleryInitial value,
          $Res Function(_$_CardGalleryInitial) then) =
      __$$_CardGalleryInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardFilterParams cardFilterParams, CardsPage page});

  @override
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
  $CardsPageCopyWith<$Res> get page;
}

/// @nodoc
class __$$_CardGalleryInitialCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryInitial>
    implements _$$_CardGalleryInitialCopyWith<$Res> {
  __$$_CardGalleryInitialCopyWithImpl(
      _$_CardGalleryInitial _value, $Res Function(_$_CardGalleryInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardFilterParams = null,
    Object? page = null,
  }) {
    return _then(_$_CardGalleryInitial(
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CardsPage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsPageCopyWith<$Res> get page {
    return $CardsPageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value));
    });
  }
}

/// @nodoc

class _$_CardGalleryInitial implements _CardGalleryInitial {
  const _$_CardGalleryInitial(
      {required this.cardFilterParams, required this.page});

  @override
  final CardFilterParams cardFilterParams;
  @override
  final CardsPage page;

  @override
  String toString() {
    return 'CardGalleryState.initial(cardFilterParams: $cardFilterParams, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryInitial &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardFilterParams, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryInitialCopyWith<_$_CardGalleryInitial> get copyWith =>
      __$$_CardGalleryInitialCopyWithImpl<_$_CardGalleryInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        initial,
    required TResult Function(CardFilterParams cardFilterParams) fetching,
    required TResult Function(CardFilterParams cardFilterParams) localeChanged,
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        fetched,
    required TResult Function(
            CardFilterParams cardFilterParams, Failure failure)
        failure,
  }) {
    return initial(cardFilterParams, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult? Function(CardFilterParams cardFilterParams)? fetching,
    TResult? Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult? Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
  }) {
    return initial?.call(cardFilterParams, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult Function(CardFilterParams cardFilterParams)? fetching,
    TResult Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(cardFilterParams, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryFetching value) fetching,
    required TResult Function(_CardGalleryLocaleChanged value) localeChanged,
    required TResult Function(_CardGalleryFetched value) fetched,
    required TResult Function(_CardGalleryError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryFetching value)? fetching,
    TResult? Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult? Function(_CardGalleryFetched value)? fetched,
    TResult? Function(_CardGalleryError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryFetching value)? fetching,
    TResult Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult Function(_CardGalleryFetched value)? fetched,
    TResult Function(_CardGalleryError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryInitial implements CardGalleryState {
  const factory _CardGalleryInitial(
      {required final CardFilterParams cardFilterParams,
      required final CardsPage page}) = _$_CardGalleryInitial;

  @override
  CardFilterParams get cardFilterParams;
  CardsPage get page;
  @override
  @JsonKey(ignore: true)
  _$$_CardGalleryInitialCopyWith<_$_CardGalleryInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardGalleryFetchingCopyWith<$Res>
    implements $CardGalleryStateCopyWith<$Res> {
  factory _$$_CardGalleryFetchingCopyWith(_$_CardGalleryFetching value,
          $Res Function(_$_CardGalleryFetching) then) =
      __$$_CardGalleryFetchingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardFilterParams cardFilterParams});

  @override
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
}

/// @nodoc
class __$$_CardGalleryFetchingCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryFetching>
    implements _$$_CardGalleryFetchingCopyWith<$Res> {
  __$$_CardGalleryFetchingCopyWithImpl(_$_CardGalleryFetching _value,
      $Res Function(_$_CardGalleryFetching) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardFilterParams = null,
  }) {
    return _then(_$_CardGalleryFetching(
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
    ));
  }
}

/// @nodoc

class _$_CardGalleryFetching implements _CardGalleryFetching {
  const _$_CardGalleryFetching({required this.cardFilterParams});

  @override
  final CardFilterParams cardFilterParams;

  @override
  String toString() {
    return 'CardGalleryState.fetching(cardFilterParams: $cardFilterParams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryFetching &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardFilterParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryFetchingCopyWith<_$_CardGalleryFetching> get copyWith =>
      __$$_CardGalleryFetchingCopyWithImpl<_$_CardGalleryFetching>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        initial,
    required TResult Function(CardFilterParams cardFilterParams) fetching,
    required TResult Function(CardFilterParams cardFilterParams) localeChanged,
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        fetched,
    required TResult Function(
            CardFilterParams cardFilterParams, Failure failure)
        failure,
  }) {
    return fetching(cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult? Function(CardFilterParams cardFilterParams)? fetching,
    TResult? Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult? Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
  }) {
    return fetching?.call(cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult Function(CardFilterParams cardFilterParams)? fetching,
    TResult Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(cardFilterParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryFetching value) fetching,
    required TResult Function(_CardGalleryLocaleChanged value) localeChanged,
    required TResult Function(_CardGalleryFetched value) fetched,
    required TResult Function(_CardGalleryError value) failure,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryFetching value)? fetching,
    TResult? Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult? Function(_CardGalleryFetched value)? fetched,
    TResult? Function(_CardGalleryError value)? failure,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryFetching value)? fetching,
    TResult Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult Function(_CardGalleryFetched value)? fetched,
    TResult Function(_CardGalleryError value)? failure,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryFetching implements CardGalleryState {
  const factory _CardGalleryFetching(
          {required final CardFilterParams cardFilterParams}) =
      _$_CardGalleryFetching;

  @override
  CardFilterParams get cardFilterParams;
  @override
  @JsonKey(ignore: true)
  _$$_CardGalleryFetchingCopyWith<_$_CardGalleryFetching> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardGalleryLocaleChangedCopyWith<$Res>
    implements $CardGalleryStateCopyWith<$Res> {
  factory _$$_CardGalleryLocaleChangedCopyWith(
          _$_CardGalleryLocaleChanged value,
          $Res Function(_$_CardGalleryLocaleChanged) then) =
      __$$_CardGalleryLocaleChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardFilterParams cardFilterParams});

  @override
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
}

/// @nodoc
class __$$_CardGalleryLocaleChangedCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryLocaleChanged>
    implements _$$_CardGalleryLocaleChangedCopyWith<$Res> {
  __$$_CardGalleryLocaleChangedCopyWithImpl(_$_CardGalleryLocaleChanged _value,
      $Res Function(_$_CardGalleryLocaleChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardFilterParams = null,
  }) {
    return _then(_$_CardGalleryLocaleChanged(
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
    ));
  }
}

/// @nodoc

class _$_CardGalleryLocaleChanged implements _CardGalleryLocaleChanged {
  const _$_CardGalleryLocaleChanged({required this.cardFilterParams});

  @override
  final CardFilterParams cardFilterParams;

  @override
  String toString() {
    return 'CardGalleryState.localeChanged(cardFilterParams: $cardFilterParams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryLocaleChanged &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardFilterParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryLocaleChangedCopyWith<_$_CardGalleryLocaleChanged>
      get copyWith => __$$_CardGalleryLocaleChangedCopyWithImpl<
          _$_CardGalleryLocaleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        initial,
    required TResult Function(CardFilterParams cardFilterParams) fetching,
    required TResult Function(CardFilterParams cardFilterParams) localeChanged,
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        fetched,
    required TResult Function(
            CardFilterParams cardFilterParams, Failure failure)
        failure,
  }) {
    return localeChanged(cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult? Function(CardFilterParams cardFilterParams)? fetching,
    TResult? Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult? Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
  }) {
    return localeChanged?.call(cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult Function(CardFilterParams cardFilterParams)? fetching,
    TResult Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(cardFilterParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryFetching value) fetching,
    required TResult Function(_CardGalleryLocaleChanged value) localeChanged,
    required TResult Function(_CardGalleryFetched value) fetched,
    required TResult Function(_CardGalleryError value) failure,
  }) {
    return localeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryFetching value)? fetching,
    TResult? Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult? Function(_CardGalleryFetched value)? fetched,
    TResult? Function(_CardGalleryError value)? failure,
  }) {
    return localeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryFetching value)? fetching,
    TResult Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult Function(_CardGalleryFetched value)? fetched,
    TResult Function(_CardGalleryError value)? failure,
    required TResult orElse(),
  }) {
    if (localeChanged != null) {
      return localeChanged(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryLocaleChanged implements CardGalleryState {
  const factory _CardGalleryLocaleChanged(
          {required final CardFilterParams cardFilterParams}) =
      _$_CardGalleryLocaleChanged;

  @override
  CardFilterParams get cardFilterParams;
  @override
  @JsonKey(ignore: true)
  _$$_CardGalleryLocaleChangedCopyWith<_$_CardGalleryLocaleChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardGalleryFetchedCopyWith<$Res>
    implements $CardGalleryStateCopyWith<$Res> {
  factory _$$_CardGalleryFetchedCopyWith(_$_CardGalleryFetched value,
          $Res Function(_$_CardGalleryFetched) then) =
      __$$_CardGalleryFetchedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardFilterParams cardFilterParams, CardsPage page});

  @override
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
  $CardsPageCopyWith<$Res> get page;
}

/// @nodoc
class __$$_CardGalleryFetchedCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryFetched>
    implements _$$_CardGalleryFetchedCopyWith<$Res> {
  __$$_CardGalleryFetchedCopyWithImpl(
      _$_CardGalleryFetched _value, $Res Function(_$_CardGalleryFetched) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardFilterParams = null,
    Object? page = null,
  }) {
    return _then(_$_CardGalleryFetched(
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CardsPage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsPageCopyWith<$Res> get page {
    return $CardsPageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value));
    });
  }
}

/// @nodoc

class _$_CardGalleryFetched implements _CardGalleryFetched {
  const _$_CardGalleryFetched(
      {required this.cardFilterParams, required this.page});

  @override
  final CardFilterParams cardFilterParams;
  @override
  final CardsPage page;

  @override
  String toString() {
    return 'CardGalleryState.fetched(cardFilterParams: $cardFilterParams, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryFetched &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardFilterParams, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryFetchedCopyWith<_$_CardGalleryFetched> get copyWith =>
      __$$_CardGalleryFetchedCopyWithImpl<_$_CardGalleryFetched>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        initial,
    required TResult Function(CardFilterParams cardFilterParams) fetching,
    required TResult Function(CardFilterParams cardFilterParams) localeChanged,
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        fetched,
    required TResult Function(
            CardFilterParams cardFilterParams, Failure failure)
        failure,
  }) {
    return fetched(cardFilterParams, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult? Function(CardFilterParams cardFilterParams)? fetching,
    TResult? Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult? Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
  }) {
    return fetched?.call(cardFilterParams, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult Function(CardFilterParams cardFilterParams)? fetching,
    TResult Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(cardFilterParams, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryFetching value) fetching,
    required TResult Function(_CardGalleryLocaleChanged value) localeChanged,
    required TResult Function(_CardGalleryFetched value) fetched,
    required TResult Function(_CardGalleryError value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryFetching value)? fetching,
    TResult? Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult? Function(_CardGalleryFetched value)? fetched,
    TResult? Function(_CardGalleryError value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryFetching value)? fetching,
    TResult Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult Function(_CardGalleryFetched value)? fetched,
    TResult Function(_CardGalleryError value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryFetched implements CardGalleryState {
  const factory _CardGalleryFetched(
      {required final CardFilterParams cardFilterParams,
      required final CardsPage page}) = _$_CardGalleryFetched;

  @override
  CardFilterParams get cardFilterParams;
  CardsPage get page;
  @override
  @JsonKey(ignore: true)
  _$$_CardGalleryFetchedCopyWith<_$_CardGalleryFetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardGalleryErrorCopyWith<$Res>
    implements $CardGalleryStateCopyWith<$Res> {
  factory _$$_CardGalleryErrorCopyWith(
          _$_CardGalleryError value, $Res Function(_$_CardGalleryError) then) =
      __$$_CardGalleryErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardFilterParams cardFilterParams, Failure failure});

  @override
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
}

/// @nodoc
class __$$_CardGalleryErrorCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryError>
    implements _$$_CardGalleryErrorCopyWith<$Res> {
  __$$_CardGalleryErrorCopyWithImpl(
      _$_CardGalleryError _value, $Res Function(_$_CardGalleryError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardFilterParams = null,
    Object? failure = null,
  }) {
    return _then(_$_CardGalleryError(
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_CardGalleryError implements _CardGalleryError {
  const _$_CardGalleryError(
      {required this.cardFilterParams, required this.failure});

  @override
  final CardFilterParams cardFilterParams;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'CardGalleryState.failure(cardFilterParams: $cardFilterParams, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryError &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardFilterParams, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryErrorCopyWith<_$_CardGalleryError> get copyWith =>
      __$$_CardGalleryErrorCopyWithImpl<_$_CardGalleryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        initial,
    required TResult Function(CardFilterParams cardFilterParams) fetching,
    required TResult Function(CardFilterParams cardFilterParams) localeChanged,
    required TResult Function(CardFilterParams cardFilterParams, CardsPage page)
        fetched,
    required TResult Function(
            CardFilterParams cardFilterParams, Failure failure)
        failure,
  }) {
    return failure(cardFilterParams, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult? Function(CardFilterParams cardFilterParams)? fetching,
    TResult? Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult? Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult? Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
  }) {
    return failure?.call(cardFilterParams, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        initial,
    TResult Function(CardFilterParams cardFilterParams)? fetching,
    TResult Function(CardFilterParams cardFilterParams)? localeChanged,
    TResult Function(CardFilterParams cardFilterParams, CardsPage page)?
        fetched,
    TResult Function(CardFilterParams cardFilterParams, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(cardFilterParams, this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryFetching value) fetching,
    required TResult Function(_CardGalleryLocaleChanged value) localeChanged,
    required TResult Function(_CardGalleryFetched value) fetched,
    required TResult Function(_CardGalleryError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryFetching value)? fetching,
    TResult? Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult? Function(_CardGalleryFetched value)? fetched,
    TResult? Function(_CardGalleryError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryFetching value)? fetching,
    TResult Function(_CardGalleryLocaleChanged value)? localeChanged,
    TResult Function(_CardGalleryFetched value)? fetched,
    TResult Function(_CardGalleryError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryError implements CardGalleryState {
  const factory _CardGalleryError(
      {required final CardFilterParams cardFilterParams,
      required final Failure failure}) = _$_CardGalleryError;

  @override
  CardFilterParams get cardFilterParams;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_CardGalleryErrorCopyWith<_$_CardGalleryError> get copyWith =>
      throw _privateConstructorUsedError;
}
