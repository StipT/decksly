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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        initial,
    required TResult Function() loading,
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult? Function()? loading,
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult Function()? loading,
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryLoading value) loading,
    required TResult Function(_CardGalleryLoaded value) loaded,
    required TResult Function(_CardGalleryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryLoading value)? loading,
    TResult? Function(_CardGalleryLoaded value)? loaded,
    TResult? Function(_CardGalleryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryLoading value)? loading,
    TResult Function(_CardGalleryLoaded value)? loaded,
    TResult Function(_CardGalleryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardGalleryStateCopyWith<$Res> {
  factory $CardGalleryStateCopyWith(
          CardGalleryState value, $Res Function(CardGalleryState) then) =
      _$CardGalleryStateCopyWithImpl<$Res, CardGalleryState>;
}

/// @nodoc
class _$CardGalleryStateCopyWithImpl<$Res, $Val extends CardGalleryState>
    implements $CardGalleryStateCopyWith<$Res> {
  _$CardGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CardGalleryInitialCopyWith<$Res> {
  factory _$$_CardGalleryInitialCopyWith(_$_CardGalleryInitial value,
          $Res Function(_$_CardGalleryInitial) then) =
      __$$_CardGalleryInitialCopyWithImpl<$Res>;
  @useResult
  $Res call({CardsPage page, CardFilterParams cardFilterParams});

  $CardsPageCopyWith<$Res> get page;
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
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
    Object? page = null,
    Object? cardFilterParams = null,
  }) {
    return _then(_$_CardGalleryInitial(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CardsPage,
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsPageCopyWith<$Res> get page {
    return $CardsPageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardFilterParamsCopyWith<$Res> get cardFilterParams {
    return $CardFilterParamsCopyWith<$Res>(_value.cardFilterParams, (value) {
      return _then(_value.copyWith(cardFilterParams: value));
    });
  }
}

/// @nodoc

class _$_CardGalleryInitial implements _CardGalleryInitial {
  const _$_CardGalleryInitial(
      {required this.page, required this.cardFilterParams});

  @override
  final CardsPage page;
  @override
  final CardFilterParams cardFilterParams;

  @override
  String toString() {
    return 'CardGalleryState.initial(page: $page, cardFilterParams: $cardFilterParams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryInitial &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, cardFilterParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryInitialCopyWith<_$_CardGalleryInitial> get copyWith =>
      __$$_CardGalleryInitialCopyWithImpl<_$_CardGalleryInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        initial,
    required TResult Function() loading,
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial(page, cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult? Function()? loading,
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call(page, cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult Function()? loading,
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(page, cardFilterParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryLoading value) loading,
    required TResult Function(_CardGalleryLoaded value) loaded,
    required TResult Function(_CardGalleryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryLoading value)? loading,
    TResult? Function(_CardGalleryLoaded value)? loaded,
    TResult? Function(_CardGalleryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryLoading value)? loading,
    TResult Function(_CardGalleryLoaded value)? loaded,
    TResult Function(_CardGalleryError value)? error,
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
          {required final CardsPage page,
          required final CardFilterParams cardFilterParams}) =
      _$_CardGalleryInitial;

  CardsPage get page;
  CardFilterParams get cardFilterParams;
  @JsonKey(ignore: true)
  _$$_CardGalleryInitialCopyWith<_$_CardGalleryInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardGalleryLoadingCopyWith<$Res> {
  factory _$$_CardGalleryLoadingCopyWith(_$_CardGalleryLoading value,
          $Res Function(_$_CardGalleryLoading) then) =
      __$$_CardGalleryLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CardGalleryLoadingCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryLoading>
    implements _$$_CardGalleryLoadingCopyWith<$Res> {
  __$$_CardGalleryLoadingCopyWithImpl(
      _$_CardGalleryLoading _value, $Res Function(_$_CardGalleryLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CardGalleryLoading implements _CardGalleryLoading {
  const _$_CardGalleryLoading();

  @override
  String toString() {
    return 'CardGalleryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CardGalleryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        initial,
    required TResult Function() loading,
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult? Function()? loading,
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult Function()? loading,
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryLoading value) loading,
    required TResult Function(_CardGalleryLoaded value) loaded,
    required TResult Function(_CardGalleryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryLoading value)? loading,
    TResult? Function(_CardGalleryLoaded value)? loaded,
    TResult? Function(_CardGalleryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryLoading value)? loading,
    TResult Function(_CardGalleryLoaded value)? loaded,
    TResult Function(_CardGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryLoading implements CardGalleryState {
  const factory _CardGalleryLoading() = _$_CardGalleryLoading;
}

/// @nodoc
abstract class _$$_CardGalleryLoadedCopyWith<$Res> {
  factory _$$_CardGalleryLoadedCopyWith(_$_CardGalleryLoaded value,
          $Res Function(_$_CardGalleryLoaded) then) =
      __$$_CardGalleryLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({CardsPage page, CardFilterParams cardFilterParams});

  $CardsPageCopyWith<$Res> get page;
  $CardFilterParamsCopyWith<$Res> get cardFilterParams;
}

/// @nodoc
class __$$_CardGalleryLoadedCopyWithImpl<$Res>
    extends _$CardGalleryStateCopyWithImpl<$Res, _$_CardGalleryLoaded>
    implements _$$_CardGalleryLoadedCopyWith<$Res> {
  __$$_CardGalleryLoadedCopyWithImpl(
      _$_CardGalleryLoaded _value, $Res Function(_$_CardGalleryLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? cardFilterParams = null,
  }) {
    return _then(_$_CardGalleryLoaded(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as CardsPage,
      cardFilterParams: null == cardFilterParams
          ? _value.cardFilterParams
          : cardFilterParams // ignore: cast_nullable_to_non_nullable
              as CardFilterParams,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsPageCopyWith<$Res> get page {
    return $CardsPageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardFilterParamsCopyWith<$Res> get cardFilterParams {
    return $CardFilterParamsCopyWith<$Res>(_value.cardFilterParams, (value) {
      return _then(_value.copyWith(cardFilterParams: value));
    });
  }
}

/// @nodoc

class _$_CardGalleryLoaded implements _CardGalleryLoaded {
  const _$_CardGalleryLoaded(
      {required this.page, required this.cardFilterParams});

  @override
  final CardsPage page;
  @override
  final CardFilterParams cardFilterParams;

  @override
  String toString() {
    return 'CardGalleryState.loaded(page: $page, cardFilterParams: $cardFilterParams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryLoaded &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.cardFilterParams, cardFilterParams) ||
                other.cardFilterParams == cardFilterParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, cardFilterParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryLoadedCopyWith<_$_CardGalleryLoaded> get copyWith =>
      __$$_CardGalleryLoadedCopyWithImpl<_$_CardGalleryLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        initial,
    required TResult Function() loading,
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(page, cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult? Function()? loading,
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(page, cardFilterParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult Function()? loading,
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(page, cardFilterParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryLoading value) loading,
    required TResult Function(_CardGalleryLoaded value) loaded,
    required TResult Function(_CardGalleryError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryLoading value)? loading,
    TResult? Function(_CardGalleryLoaded value)? loaded,
    TResult? Function(_CardGalleryError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryLoading value)? loading,
    TResult Function(_CardGalleryLoaded value)? loaded,
    TResult Function(_CardGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryLoaded implements CardGalleryState {
  const factory _CardGalleryLoaded(
      {required final CardsPage page,
      required final CardFilterParams cardFilterParams}) = _$_CardGalleryLoaded;

  CardsPage get page;
  CardFilterParams get cardFilterParams;
  @JsonKey(ignore: true)
  _$$_CardGalleryLoadedCopyWith<_$_CardGalleryLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardGalleryErrorCopyWith<$Res> {
  factory _$$_CardGalleryErrorCopyWith(
          _$_CardGalleryError value, $Res Function(_$_CardGalleryError) then) =
      __$$_CardGalleryErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
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
    Object? failure = null,
  }) {
    return _then(_$_CardGalleryError(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_CardGalleryError implements _CardGalleryError {
  const _$_CardGalleryError({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'CardGalleryState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardGalleryError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardGalleryErrorCopyWith<_$_CardGalleryError> get copyWith =>
      __$$_CardGalleryErrorCopyWithImpl<_$_CardGalleryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        initial,
    required TResult Function() loading,
    required TResult Function(CardsPage page, CardFilterParams cardFilterParams)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult? Function()? loading,
    TResult? Function(CardsPage page, CardFilterParams cardFilterParams)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)?
        initial,
    TResult Function()? loading,
    TResult Function(CardsPage page, CardFilterParams cardFilterParams)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardGalleryInitial value) initial,
    required TResult Function(_CardGalleryLoading value) loading,
    required TResult Function(_CardGalleryLoaded value) loaded,
    required TResult Function(_CardGalleryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardGalleryInitial value)? initial,
    TResult? Function(_CardGalleryLoading value)? loading,
    TResult? Function(_CardGalleryLoaded value)? loaded,
    TResult? Function(_CardGalleryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardGalleryInitial value)? initial,
    TResult Function(_CardGalleryLoading value)? loading,
    TResult Function(_CardGalleryLoaded value)? loaded,
    TResult Function(_CardGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CardGalleryError implements CardGalleryState {
  const factory _CardGalleryError({required final Failure failure}) =
      _$_CardGalleryError;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_CardGalleryErrorCopyWith<_$_CardGalleryError> get copyWith =>
      throw _privateConstructorUsedError;
}
