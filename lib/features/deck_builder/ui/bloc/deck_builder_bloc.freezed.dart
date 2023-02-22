// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_builder_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeckBuilderState {
  Deck get deck => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) codeGenerated,
    required TResult Function(Deck deck, Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? codeGenerated,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? codeGenerated,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckBuilderInitial value) initial,
    required TResult Function(_DeckBuilderChanged value) changed,
    required TResult Function(_DeckBuilderCodeGenerated value) codeGenerated,
    required TResult Function(_DeckBuilderError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckBuilderInitial value)? initial,
    TResult? Function(_DeckBuilderChanged value)? changed,
    TResult? Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult? Function(_DeckBuilderError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckBuilderInitial value)? initial,
    TResult Function(_DeckBuilderChanged value)? changed,
    TResult Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult Function(_DeckBuilderError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckBuilderStateCopyWith<DeckBuilderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckBuilderStateCopyWith<$Res> {
  factory $DeckBuilderStateCopyWith(
          DeckBuilderState value, $Res Function(DeckBuilderState) then) =
      _$DeckBuilderStateCopyWithImpl<$Res, DeckBuilderState>;
  @useResult
  $Res call({Deck deck});

  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class _$DeckBuilderStateCopyWithImpl<$Res, $Val extends DeckBuilderState>
    implements $DeckBuilderStateCopyWith<$Res> {
  _$DeckBuilderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_value.copyWith(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeckCopyWith<$Res> get deck {
    return $DeckCopyWith<$Res>(_value.deck, (value) {
      return _then(_value.copyWith(deck: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeckBuilderInitialCopyWith<$Res>
    implements $DeckBuilderStateCopyWith<$Res> {
  factory _$$_DeckBuilderInitialCopyWith(_$_DeckBuilderInitial value,
          $Res Function(_$_DeckBuilderInitial) then) =
      __$$_DeckBuilderInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckBuilderInitialCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res, _$_DeckBuilderInitial>
    implements _$$_DeckBuilderInitialCopyWith<$Res> {
  __$$_DeckBuilderInitialCopyWithImpl(
      _$_DeckBuilderInitial _value, $Res Function(_$_DeckBuilderInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_$_DeckBuilderInitial(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ));
  }
}

/// @nodoc

class _$_DeckBuilderInitial implements _DeckBuilderInitial {
  const _$_DeckBuilderInitial({required this.deck});

  @override
  final Deck deck;

  @override
  String toString() {
    return 'DeckBuilderState.initial(deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckBuilderInitial &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckBuilderInitialCopyWith<_$_DeckBuilderInitial> get copyWith =>
      __$$_DeckBuilderInitialCopyWithImpl<_$_DeckBuilderInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) codeGenerated,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return initial(deck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? codeGenerated,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return initial?.call(deck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? codeGenerated,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(deck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckBuilderInitial value) initial,
    required TResult Function(_DeckBuilderChanged value) changed,
    required TResult Function(_DeckBuilderCodeGenerated value) codeGenerated,
    required TResult Function(_DeckBuilderError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckBuilderInitial value)? initial,
    TResult? Function(_DeckBuilderChanged value)? changed,
    TResult? Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult? Function(_DeckBuilderError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckBuilderInitial value)? initial,
    TResult Function(_DeckBuilderChanged value)? changed,
    TResult Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult Function(_DeckBuilderError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DeckBuilderInitial implements DeckBuilderState {
  const factory _DeckBuilderInitial({required final Deck deck}) =
      _$_DeckBuilderInitial;

  @override
  Deck get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckBuilderInitialCopyWith<_$_DeckBuilderInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckBuilderChangedCopyWith<$Res>
    implements $DeckBuilderStateCopyWith<$Res> {
  factory _$$_DeckBuilderChangedCopyWith(_$_DeckBuilderChanged value,
          $Res Function(_$_DeckBuilderChanged) then) =
      __$$_DeckBuilderChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckBuilderChangedCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res, _$_DeckBuilderChanged>
    implements _$$_DeckBuilderChangedCopyWith<$Res> {
  __$$_DeckBuilderChangedCopyWithImpl(
      _$_DeckBuilderChanged _value, $Res Function(_$_DeckBuilderChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_$_DeckBuilderChanged(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ));
  }
}

/// @nodoc

class _$_DeckBuilderChanged implements _DeckBuilderChanged {
  const _$_DeckBuilderChanged({required this.deck});

  @override
  final Deck deck;

  @override
  String toString() {
    return 'DeckBuilderState.changed(deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckBuilderChanged &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckBuilderChangedCopyWith<_$_DeckBuilderChanged> get copyWith =>
      __$$_DeckBuilderChangedCopyWithImpl<_$_DeckBuilderChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) codeGenerated,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return changed(deck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? codeGenerated,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return changed?.call(deck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? codeGenerated,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(deck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckBuilderInitial value) initial,
    required TResult Function(_DeckBuilderChanged value) changed,
    required TResult Function(_DeckBuilderCodeGenerated value) codeGenerated,
    required TResult Function(_DeckBuilderError value) failure,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckBuilderInitial value)? initial,
    TResult? Function(_DeckBuilderChanged value)? changed,
    TResult? Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult? Function(_DeckBuilderError value)? failure,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckBuilderInitial value)? initial,
    TResult Function(_DeckBuilderChanged value)? changed,
    TResult Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult Function(_DeckBuilderError value)? failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _DeckBuilderChanged implements DeckBuilderState {
  const factory _DeckBuilderChanged({required final Deck deck}) =
      _$_DeckBuilderChanged;

  @override
  Deck get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckBuilderChangedCopyWith<_$_DeckBuilderChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckBuilderCodeGeneratedCopyWith<$Res>
    implements $DeckBuilderStateCopyWith<$Res> {
  factory _$$_DeckBuilderCodeGeneratedCopyWith(
          _$_DeckBuilderCodeGenerated value,
          $Res Function(_$_DeckBuilderCodeGenerated) then) =
      __$$_DeckBuilderCodeGeneratedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckBuilderCodeGeneratedCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res, _$_DeckBuilderCodeGenerated>
    implements _$$_DeckBuilderCodeGeneratedCopyWith<$Res> {
  __$$_DeckBuilderCodeGeneratedCopyWithImpl(_$_DeckBuilderCodeGenerated _value,
      $Res Function(_$_DeckBuilderCodeGenerated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_$_DeckBuilderCodeGenerated(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ));
  }
}

/// @nodoc

class _$_DeckBuilderCodeGenerated implements _DeckBuilderCodeGenerated {
  const _$_DeckBuilderCodeGenerated({required this.deck});

  @override
  final Deck deck;

  @override
  String toString() {
    return 'DeckBuilderState.codeGenerated(deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckBuilderCodeGenerated &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckBuilderCodeGeneratedCopyWith<_$_DeckBuilderCodeGenerated>
      get copyWith => __$$_DeckBuilderCodeGeneratedCopyWithImpl<
          _$_DeckBuilderCodeGenerated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) codeGenerated,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return codeGenerated(deck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? codeGenerated,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return codeGenerated?.call(deck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? codeGenerated,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (codeGenerated != null) {
      return codeGenerated(deck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckBuilderInitial value) initial,
    required TResult Function(_DeckBuilderChanged value) changed,
    required TResult Function(_DeckBuilderCodeGenerated value) codeGenerated,
    required TResult Function(_DeckBuilderError value) failure,
  }) {
    return codeGenerated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckBuilderInitial value)? initial,
    TResult? Function(_DeckBuilderChanged value)? changed,
    TResult? Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult? Function(_DeckBuilderError value)? failure,
  }) {
    return codeGenerated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckBuilderInitial value)? initial,
    TResult Function(_DeckBuilderChanged value)? changed,
    TResult Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult Function(_DeckBuilderError value)? failure,
    required TResult orElse(),
  }) {
    if (codeGenerated != null) {
      return codeGenerated(this);
    }
    return orElse();
  }
}

abstract class _DeckBuilderCodeGenerated implements DeckBuilderState {
  const factory _DeckBuilderCodeGenerated({required final Deck deck}) =
      _$_DeckBuilderCodeGenerated;

  @override
  Deck get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckBuilderCodeGeneratedCopyWith<_$_DeckBuilderCodeGenerated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckBuilderErrorCopyWith<$Res>
    implements $DeckBuilderStateCopyWith<$Res> {
  factory _$$_DeckBuilderErrorCopyWith(
          _$_DeckBuilderError value, $Res Function(_$_DeckBuilderError) then) =
      __$$_DeckBuilderErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck, Failure failure});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckBuilderErrorCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res, _$_DeckBuilderError>
    implements _$$_DeckBuilderErrorCopyWith<$Res> {
  __$$_DeckBuilderErrorCopyWithImpl(
      _$_DeckBuilderError _value, $Res Function(_$_DeckBuilderError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? failure = null,
  }) {
    return _then(_$_DeckBuilderError(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_DeckBuilderError implements _DeckBuilderError {
  const _$_DeckBuilderError({required this.deck, required this.failure});

  @override
  final Deck deck;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'DeckBuilderState.failure(deck: $deck, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckBuilderError &&
            (identical(other.deck, deck) || other.deck == deck) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckBuilderErrorCopyWith<_$_DeckBuilderError> get copyWith =>
      __$$_DeckBuilderErrorCopyWithImpl<_$_DeckBuilderError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) codeGenerated,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return failure(deck, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? codeGenerated,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return failure?.call(deck, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? codeGenerated,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(deck, this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckBuilderInitial value) initial,
    required TResult Function(_DeckBuilderChanged value) changed,
    required TResult Function(_DeckBuilderCodeGenerated value) codeGenerated,
    required TResult Function(_DeckBuilderError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckBuilderInitial value)? initial,
    TResult? Function(_DeckBuilderChanged value)? changed,
    TResult? Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult? Function(_DeckBuilderError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckBuilderInitial value)? initial,
    TResult Function(_DeckBuilderChanged value)? changed,
    TResult Function(_DeckBuilderCodeGenerated value)? codeGenerated,
    TResult Function(_DeckBuilderError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _DeckBuilderError implements DeckBuilderState {
  const factory _DeckBuilderError(
      {required final Deck deck,
      required final Failure failure}) = _$_DeckBuilderError;

  @override
  Deck get deck;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_DeckBuilderErrorCopyWith<_$_DeckBuilderError> get copyWith =>
      throw _privateConstructorUsedError;
}
