// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeckSelectionState {
  Deck get deck => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) deckImported,
    required TResult Function(Deck deck, Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? deckImported,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? deckImported,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckSelectionInitial value) initial,
    required TResult Function(_DeckSelectionChanged value) changed,
    required TResult Function(_DeckSelectionImported value) deckImported,
    required TResult Function(_DeckSelectionFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckSelectionInitial value)? initial,
    TResult? Function(_DeckSelectionChanged value)? changed,
    TResult? Function(_DeckSelectionImported value)? deckImported,
    TResult? Function(_DeckSelectionFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckSelectionInitial value)? initial,
    TResult Function(_DeckSelectionChanged value)? changed,
    TResult Function(_DeckSelectionImported value)? deckImported,
    TResult Function(_DeckSelectionFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckSelectionStateCopyWith<DeckSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckSelectionStateCopyWith<$Res> {
  factory $DeckSelectionStateCopyWith(
          DeckSelectionState value, $Res Function(DeckSelectionState) then) =
      _$DeckSelectionStateCopyWithImpl<$Res, DeckSelectionState>;
  @useResult
  $Res call({Deck deck});

  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class _$DeckSelectionStateCopyWithImpl<$Res, $Val extends DeckSelectionState>
    implements $DeckSelectionStateCopyWith<$Res> {
  _$DeckSelectionStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeckSelectionInitialCopyWith<$Res>
    implements $DeckSelectionStateCopyWith<$Res> {
  factory _$$_DeckSelectionInitialCopyWith(_$_DeckSelectionInitial value,
          $Res Function(_$_DeckSelectionInitial) then) =
      __$$_DeckSelectionInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckSelectionInitialCopyWithImpl<$Res>
    extends _$DeckSelectionStateCopyWithImpl<$Res, _$_DeckSelectionInitial>
    implements _$$_DeckSelectionInitialCopyWith<$Res> {
  __$$_DeckSelectionInitialCopyWithImpl(_$_DeckSelectionInitial _value,
      $Res Function(_$_DeckSelectionInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_$_DeckSelectionInitial(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ));
  }
}

/// @nodoc

class _$_DeckSelectionInitial implements _DeckSelectionInitial {
  const _$_DeckSelectionInitial({required this.deck});

  @override
  final Deck deck;

  @override
  String toString() {
    return 'DeckSelectionState.initial(deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckSelectionInitial &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckSelectionInitialCopyWith<_$_DeckSelectionInitial> get copyWith =>
      __$$_DeckSelectionInitialCopyWithImpl<_$_DeckSelectionInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) deckImported,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return initial(deck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? deckImported,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return initial?.call(deck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? deckImported,
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
    required TResult Function(_DeckSelectionInitial value) initial,
    required TResult Function(_DeckSelectionChanged value) changed,
    required TResult Function(_DeckSelectionImported value) deckImported,
    required TResult Function(_DeckSelectionFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckSelectionInitial value)? initial,
    TResult? Function(_DeckSelectionChanged value)? changed,
    TResult? Function(_DeckSelectionImported value)? deckImported,
    TResult? Function(_DeckSelectionFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckSelectionInitial value)? initial,
    TResult Function(_DeckSelectionChanged value)? changed,
    TResult Function(_DeckSelectionImported value)? deckImported,
    TResult Function(_DeckSelectionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DeckSelectionInitial implements DeckSelectionState {
  const factory _DeckSelectionInitial({required final Deck deck}) =
      _$_DeckSelectionInitial;

  @override
  Deck get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckSelectionInitialCopyWith<_$_DeckSelectionInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckSelectionChangedCopyWith<$Res>
    implements $DeckSelectionStateCopyWith<$Res> {
  factory _$$_DeckSelectionChangedCopyWith(_$_DeckSelectionChanged value,
          $Res Function(_$_DeckSelectionChanged) then) =
      __$$_DeckSelectionChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckSelectionChangedCopyWithImpl<$Res>
    extends _$DeckSelectionStateCopyWithImpl<$Res, _$_DeckSelectionChanged>
    implements _$$_DeckSelectionChangedCopyWith<$Res> {
  __$$_DeckSelectionChangedCopyWithImpl(_$_DeckSelectionChanged _value,
      $Res Function(_$_DeckSelectionChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_$_DeckSelectionChanged(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ));
  }
}

/// @nodoc

class _$_DeckSelectionChanged implements _DeckSelectionChanged {
  const _$_DeckSelectionChanged({required this.deck});

  @override
  final Deck deck;

  @override
  String toString() {
    return 'DeckSelectionState.changed(deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckSelectionChanged &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckSelectionChangedCopyWith<_$_DeckSelectionChanged> get copyWith =>
      __$$_DeckSelectionChangedCopyWithImpl<_$_DeckSelectionChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) deckImported,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return changed(deck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? deckImported,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return changed?.call(deck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? deckImported,
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
    required TResult Function(_DeckSelectionInitial value) initial,
    required TResult Function(_DeckSelectionChanged value) changed,
    required TResult Function(_DeckSelectionImported value) deckImported,
    required TResult Function(_DeckSelectionFailure value) failure,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckSelectionInitial value)? initial,
    TResult? Function(_DeckSelectionChanged value)? changed,
    TResult? Function(_DeckSelectionImported value)? deckImported,
    TResult? Function(_DeckSelectionFailure value)? failure,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckSelectionInitial value)? initial,
    TResult Function(_DeckSelectionChanged value)? changed,
    TResult Function(_DeckSelectionImported value)? deckImported,
    TResult Function(_DeckSelectionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _DeckSelectionChanged implements DeckSelectionState {
  const factory _DeckSelectionChanged({required final Deck deck}) =
      _$_DeckSelectionChanged;

  @override
  Deck get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckSelectionChangedCopyWith<_$_DeckSelectionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckSelectionImportedCopyWith<$Res>
    implements $DeckSelectionStateCopyWith<$Res> {
  factory _$$_DeckSelectionImportedCopyWith(_$_DeckSelectionImported value,
          $Res Function(_$_DeckSelectionImported) then) =
      __$$_DeckSelectionImportedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckSelectionImportedCopyWithImpl<$Res>
    extends _$DeckSelectionStateCopyWithImpl<$Res, _$_DeckSelectionImported>
    implements _$$_DeckSelectionImportedCopyWith<$Res> {
  __$$_DeckSelectionImportedCopyWithImpl(_$_DeckSelectionImported _value,
      $Res Function(_$_DeckSelectionImported) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
  }) {
    return _then(_$_DeckSelectionImported(
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as Deck,
    ));
  }
}

/// @nodoc

class _$_DeckSelectionImported implements _DeckSelectionImported {
  const _$_DeckSelectionImported({required this.deck});

  @override
  final Deck deck;

  @override
  String toString() {
    return 'DeckSelectionState.deckImported(deck: $deck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckSelectionImported &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckSelectionImportedCopyWith<_$_DeckSelectionImported> get copyWith =>
      __$$_DeckSelectionImportedCopyWithImpl<_$_DeckSelectionImported>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) deckImported,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return deckImported(deck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? deckImported,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return deckImported?.call(deck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? deckImported,
    TResult Function(Deck deck, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (deckImported != null) {
      return deckImported(deck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckSelectionInitial value) initial,
    required TResult Function(_DeckSelectionChanged value) changed,
    required TResult Function(_DeckSelectionImported value) deckImported,
    required TResult Function(_DeckSelectionFailure value) failure,
  }) {
    return deckImported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckSelectionInitial value)? initial,
    TResult? Function(_DeckSelectionChanged value)? changed,
    TResult? Function(_DeckSelectionImported value)? deckImported,
    TResult? Function(_DeckSelectionFailure value)? failure,
  }) {
    return deckImported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckSelectionInitial value)? initial,
    TResult Function(_DeckSelectionChanged value)? changed,
    TResult Function(_DeckSelectionImported value)? deckImported,
    TResult Function(_DeckSelectionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (deckImported != null) {
      return deckImported(this);
    }
    return orElse();
  }
}

abstract class _DeckSelectionImported implements DeckSelectionState {
  const factory _DeckSelectionImported({required final Deck deck}) =
      _$_DeckSelectionImported;

  @override
  Deck get deck;
  @override
  @JsonKey(ignore: true)
  _$$_DeckSelectionImportedCopyWith<_$_DeckSelectionImported> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckSelectionFailureCopyWith<$Res>
    implements $DeckSelectionStateCopyWith<$Res> {
  factory _$$_DeckSelectionFailureCopyWith(_$_DeckSelectionFailure value,
          $Res Function(_$_DeckSelectionFailure) then) =
      __$$_DeckSelectionFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Deck deck, Failure failure});

  @override
  $DeckCopyWith<$Res> get deck;
}

/// @nodoc
class __$$_DeckSelectionFailureCopyWithImpl<$Res>
    extends _$DeckSelectionStateCopyWithImpl<$Res, _$_DeckSelectionFailure>
    implements _$$_DeckSelectionFailureCopyWith<$Res> {
  __$$_DeckSelectionFailureCopyWithImpl(_$_DeckSelectionFailure _value,
      $Res Function(_$_DeckSelectionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = null,
    Object? failure = null,
  }) {
    return _then(_$_DeckSelectionFailure(
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

class _$_DeckSelectionFailure implements _DeckSelectionFailure {
  const _$_DeckSelectionFailure({required this.deck, required this.failure});

  @override
  final Deck deck;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'DeckSelectionState.failure(deck: $deck, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckSelectionFailure &&
            (identical(other.deck, deck) || other.deck == deck) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deck, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckSelectionFailureCopyWith<_$_DeckSelectionFailure> get copyWith =>
      __$$_DeckSelectionFailureCopyWithImpl<_$_DeckSelectionFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Deck deck) initial,
    required TResult Function(Deck deck) changed,
    required TResult Function(Deck deck) deckImported,
    required TResult Function(Deck deck, Failure failure) failure,
  }) {
    return failure(deck, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Deck deck)? initial,
    TResult? Function(Deck deck)? changed,
    TResult? Function(Deck deck)? deckImported,
    TResult? Function(Deck deck, Failure failure)? failure,
  }) {
    return failure?.call(deck, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Deck deck)? initial,
    TResult Function(Deck deck)? changed,
    TResult Function(Deck deck)? deckImported,
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
    required TResult Function(_DeckSelectionInitial value) initial,
    required TResult Function(_DeckSelectionChanged value) changed,
    required TResult Function(_DeckSelectionImported value) deckImported,
    required TResult Function(_DeckSelectionFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckSelectionInitial value)? initial,
    TResult? Function(_DeckSelectionChanged value)? changed,
    TResult? Function(_DeckSelectionImported value)? deckImported,
    TResult? Function(_DeckSelectionFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckSelectionInitial value)? initial,
    TResult Function(_DeckSelectionChanged value)? changed,
    TResult Function(_DeckSelectionImported value)? deckImported,
    TResult Function(_DeckSelectionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _DeckSelectionFailure implements DeckSelectionState {
  const factory _DeckSelectionFailure(
      {required final Deck deck,
      required final Failure failure}) = _$_DeckSelectionFailure;

  @override
  Deck get deck;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_DeckSelectionFailureCopyWith<_$_DeckSelectionFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
